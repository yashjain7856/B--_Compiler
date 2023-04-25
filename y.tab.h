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
    DATA = 279,
    DEF = 280,
    DIM = 281,
    END = 282,
    FOR = 283,
    TO = 284,
    STEP = 285,
    NEXT = 286,
    GOSUB = 287,
    GOTO = 288,
    IF = 289,
    THEN = 290,
    LET = 291,
    INPUT = 292,
    PRINT = 293,
    REM = 294,
    RETURN = 295,
    STOP = 296,
    STRING_LITERAL = 297,
    AR_VARNAME = 298,
    VARNAME = 299
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
#define DATA 279
#define DEF 280
#define DIM 281
#define END 282
#define FOR 283
#define TO 284
#define STEP 285
#define NEXT 286
#define GOSUB 287
#define GOTO 288
#define IF 289
#define THEN 290
#define LET 291
#define INPUT 292
#define PRINT 293
#define REM 294
#define RETURN 295
#define STOP 296
#define STRING_LITERAL 297
#define AR_VARNAME 298
#define VARNAME 299

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
