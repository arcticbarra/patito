/* A Bison parser, made by GNU Bison 3.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_LITTLEDUCK_TAB_H_INCLUDED
# define YY_YY_LITTLEDUCK_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    PROGRAM = 258,
    VAR = 259,
    INT = 260,
    FLOAT = 261,
    IF = 262,
    ELSE = 263,
    PRINT = 264,
    CTE_STRING = 265,
    ID = 266,
    CTE_I = 267,
    CTE_F = 268,
    SEMICOLON = 269,
    LEFT_CURLYBRACKET = 270,
    RIGHT_CURLYBRACKET = 271,
    COLON = 272,
    COMMA = 273,
    EQUAL_SIGN = 274,
    LESS_THAN = 275,
    GREATER_THAN = 276,
    NOT_EQUAL = 277,
    LEFT_PARENTHESIS = 278,
    RIGHT_PARENTHESIS = 279,
    PLUS_SIGN = 280,
    MINUS_SIGN = 281,
    MULTIPLICATION_SIGN = 282,
    DIVISION_SIGN = 283
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 14 "littleDuck.y" /* yacc.c:1919  */

	int ival;
	float fval;
	char *sval;

#line 89 "littleDuck.tab.h" /* yacc.c:1919  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_LITTLEDUCK_TAB_H_INCLUDED  */
