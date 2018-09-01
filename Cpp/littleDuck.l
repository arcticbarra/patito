%{
#include <cstdio>
#include <iostream>
using namespace std;
#define YY_DECL extern "C" int yylex()
int line_count = 1;
#include "littleDuck.tab.h" // Token retrieval
%}
%%
program         { return PROGRAM; }
";"					{ return SEMICOLON; }
"{"					{ return LEFT_CURLYBRACKET; }
"}"					{ return RIGHT_CURLYBRACKET; }
":"					{ return COLON; }
","					{ return COMMA; }
"="					{ return EQUAL_SIGN; }
"<"					{ return LESS_THAN; }
">"					{ return GREATER_THAN; }
"<>"				{ return NOT_EQUAL; }
"("					{ return LEFT_PARENTHESIS; }
")"					{ return RIGHT_PARENTHESIS; }
"+"					{ return PLUS_SIGN; }
"-"					{ return MINUS_SIGN; }
"*"					{ return MULTIPLICATION_SIGN; }
"/"					{ return DIVISION_SIGN; }
var             { return VAR; }
int             { return INT; }
float           { return FLOAT; }
if              { return IF; }
else            { return ELSE; }
print           { return PRINT; }
\".*\"            { return CTE_STRING; }
[A-z][A-z0-9_]* { return ID; }
[0-9]+          { return CTE_I; }
[0-9]+\.[0-9]+  { return CTE_F; }
[\n]            { ++line_count; }
.                               ;
%%
