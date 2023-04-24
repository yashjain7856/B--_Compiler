/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
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
    NUM = 258,
    NL = 259,
    COMMA = 260,
    SEMICOLON = 261,
    PLUS = 262,
    MINUS = 263,
    MUL = 264,
    DIV = 265,
    EXPO = 266,
    LPAR = 267,
    RPAR = 268,
    EQUAL = 269,
    NOTEQUAL = 270,
    LESSTHAN = 271,
    GREATERTHAN = 272,
    LESSEQUAL = 273,
    GREATEREQUAL = 274,
    NOT = 275,
    AND = 276,
    OR = 277,
    XOR = 278,
    PRINT = 279,
    REM = 280,
    END = 281,
    LET = 282
  };
#endif
/* Tokens.  */
#define NUM 258
#define NL 259
#define COMMA 260
#define SEMICOLON 261
#define PLUS 262
#define MINUS 263
#define MUL 264
#define DIV 265
#define EXPO 266
#define LPAR 267
#define RPAR 268
#define EQUAL 269
#define NOTEQUAL 270
#define LESSTHAN 271
#define GREATERTHAN 272
#define LESSEQUAL 273
#define GREATEREQUAL 274
#define NOT 275
#define AND 276
#define OR 277
#define XOR 278
#define PRINT 279
#define REM 280
#define END 281
#define LET 282

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
