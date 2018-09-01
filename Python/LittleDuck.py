from lark import Lark
from lark.tree import pydot__tree_to_png

# Crear el parser
little_duck_parser = Lark(r"""
  %ignore /[ \t\n\f\r]+/
  PROGRAM : /program/
  VAR : /var/
  INT : /int/
  FLOAT : /float/
  IF : /if/
  ELSE : /else/
  PRINT : /print/
  CTE_STRING : /".*"/
  ID : /[A-z][A-z0-9_]*/
  CTE_I : /[0-9]+/
  CTE_F : /[0-9]+\.[0-9]+/

  programa : PROGRAM ID ";" vars* bloque
           | PROGRAM ID ";" bloque
  vars : VAR ID ":" tipo ";"
  tipo : INT | FLOAT
  suma_resta : "+" | "-"
  multiplica_divide : "*" | "/"
  comparador : "<" | ">" | "<>"
  var_cte : ID | CTE_I | CTE_F
  asignacion : ID "=" expresion ";"
  escritura : PRINT "(" print_stmt ")" ";"
  ?estatuto : asignacion | condicion | escritura
  bloque : "{" estatuto* "}"
  ?factor : "(" expresion ")" | suma_resta var_cte | var_cte
  ?termino : factor | factor multiplica_divide factor
  ?expresion : exp | exp comparador exp
  ?exp : termino | termino suma_resta exp
  ?print_stmt : expresion "," print_stmt
    | CTE_STRING "," print_stmt
    | expresion
    | CTE_STRING
  condicion : IF "(" expresion ")" bloque ";"
            | IF "(" expresion ")" bloque ELSE bloque
""", start='programa')

programa_prueba = """
  program test;
  var age1 : int;
  var age2 : int;
  var total : int;
  {
    age1 = 5;
    age2 = 8;
    total = (age1 + age2) * 5;
    if (total > 18) {
      print("Puedes pasar, tienes: ", total);
    } else {
      print("No puedes pasar, tienes: ", total);
    }
  }
"""

# Ejecutar el parser
tree = little_duck_parser.parse(programa_prueba)

# Generar el archivo de salida
pydot__tree_to_png(tree, "little_duck.png")
