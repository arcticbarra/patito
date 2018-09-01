%{
#include <cstdio>
#include <iostream>
using namespace std;
extern "C" int yylex();
extern "C" int yyparse();
extern "C" FILE *yyin;
extern int line_count;
 
void yyerror(const char *s);
%}

// Tipos de los terminales y no terminales
%union {
	int ival;
	float fval;
	char *sval;
}

// Terminales
%token <sval> PROGRAM
%token <sval> VAR
%token <sval> INT
%token <sval> FLOAT
%token <sval> IF
%token <sval> ELSE
%token <sval> PRINT
%token <sval> CTE_STRING
%token <sval> ID
%token <ival> CTE_I
%token <fval> CTE_F
%token <sval> SEMICOLON
%token <sval> LEFT_CURLYBRACKET
%token <sval> RIGHT_CURLYBRACKET
%token <sval> COLON
%token <sval> COMMA
%token <sval> EQUAL_SIGN
%token <sval> LESS_THAN
%token <sval> GREATER_THAN
%token <sval> NOT_EQUAL
%token <sval> LEFT_PARENTHESIS
%token <sval> RIGHT_PARENTHESIS
%token <sval> PLUS_SIGN
%token <sval> MINUS_SIGN
%token <sval> MULTIPLICATION_SIGN
%token <sval> DIVISION_SIGN

// No terminales
%type <sval> programa
%type <sval> vars
%type <sval> tipo
%type <sval> suma_resta
%type <sval> multiplica_divide
%type <sval> comparador
%type <sval> var_cte
%type <sval> asignacion
%type <sval> escritura
%type <sval> estatuto
%type <sval> bloque
%type <sval> e
%type <sval> factor
%type <sval> termino
%type <sval> expresion
%type <sval> exp
%type <sval> print_stmt
%type <sval> condicion

// Gramática a parsear
%%
programa: PROGRAM ID SEMICOLON vars bloque {cout << "Programa válido con "<< line_count << " lineas de código."  << endl;}
          | PROGRAM ID SEMICOLON bloque {cout << "Programa válido con "<< line_count << " lineas de código."  << endl;}
          ;
vars: /* empty */
      | VAR ID COLON tipo SEMICOLON vars {};
tipo: INT {}
    | FLOAT {}
    ;
suma_resta: PLUS_SIGN {}
          | MINUS_SIGN {}
          ;
multiplica_divide: MULTIPLICATION_SIGN {}
                  | DIVISION_SIGN {}
                  ;
comparador: LESS_THAN {}
          | GREATER_THAN {}
          | NOT_EQUAL {}
          ;
var_cte: ID {}
        | CTE_I {}
        | CTE_F {}
        ;
asignacion: ID EQUAL_SIGN expresion SEMICOLON {};
escritura: PRINT LEFT_PARENTHESIS print_stmt RIGHT_PARENTHESIS SEMICOLON {};
estatuto: asignacion {}
        | condicion {}
        | escritura {}
        ;
bloque: LEFT_CURLYBRACKET e RIGHT_CURLYBRACKET {};
e: /* empty */
  | estatuto e {};
factor: LEFT_PARENTHESIS expresion RIGHT_PARENTHESIS {}
      | suma_resta var_cte {}
      | var_cte {}
      ;
termino: factor {}
        | factor multiplica_divide factor {}
        ;
expresion: exp {} 
        | exp comparador exp {}
        ;
exp: termino {} 
    | termino suma_resta exp {}
    ;
print_stmt: expresion COMMA print_stmt {}
          | CTE_STRING COMMA print_stmt {}
          | expresion {}
          | CTE_STRING {}
          ;
condicion: IF LEFT_PARENTHESIS expresion RIGHT_PARENTHESIS bloque SEMICOLON {}
          | IF LEFT_PARENTHESIS expresion RIGHT_PARENTHESIS bloque ELSE bloque {}
          ;
%%

int main(int, char**) {
	// Abrir el archivo a parsear
	FILE *myfile = fopen("input.txt", "r");
	// Checar que sea un archivo válido
	if (!myfile) {
		cout << "I can't open input.txt!" << endl;
		return -1;
	}
	// Que flex lea el archivo en lugar del stdin
	yyin = myfile;
	
	// Parsear el input
	do {
		yyparse();
	} while (!feof(yyin));	
}

void yyerror(const char *s) {
	cout << "Parse error in line " << line_count <<"! Message: " << s << endl;
	exit(-1);
}
