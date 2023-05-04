%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}


%%
    /* Line number or number */
[0-9]+ {yylval=atoi(yytext); fprintf(yyout, "NUM FOUND: %d\n",yylval); return NUM;}

    /* Statement Type */
DATA {fprintf(yyout, "DATA FOUND\n"); return DATA;}
DEF {fprintf(yyout, "DEF FOUND\n"); return DEF;}
FN {fprintf(yyout, "FN FOUND\n"); return FN;}
DIM {fprintf(yyout, "DIM FOUND\n"); return DIM;}
END {fprintf(yyout, "END FOUND\n"); return END;}
FOR {fprintf(yyout, "FOR FOUND\n"); return FOR;}
TO {fprintf(yyout, "TO FOUND\n"); return TO;}
STEP {fprintf(yyout, "STEP FOUND\n"); return STEP;}
NEXT {fprintf(yyout, "NEXT FOUND\n"); return NEXT;}
GOSUB {fprintf(yyout, "GOSUB FOUND\n"); return GOSUB;}
GOTO {fprintf(yyout, "GOTO FOUND\n"); return GOTO;}
IF {fprintf(yyout, "IF FOUND\n"); return IF;}
THEN {fprintf(yyout, "THEN FOUND\n"); return THEN;}
LET {fprintf(yyout, "LET FOUND\n"); return LET;}
INPUT {fprintf(yyout, "INPUT FOUND\n"); return INPUT;}
PRINT {fprintf(yyout, "PRINT FOUND\n");return PRINT;}
REM.* {fprintf(yyout, "REM FOUND\n"); return REM;}
RETURN {fprintf(yyout, "RETURN FOUND\n"); return RETURN;}
STOP {fprintf(yyout, "STOP FOUND\n"); return STOP;}

    /* Arithmetic Operators */
\( {fprintf(yyout, "LPAR FOUND\n"); return LPAR;}
\) {fprintf(yyout, "RPAR FOUND\n"); return RPAR;}
\^ {fprintf(yyout, "EXPO FOUND\n"); return EXPO;}
\* {fprintf(yyout, "MUL FOUND\n"); return MUL;}
\/ {fprintf(yyout, "DIV FOUND\n"); return DIV;}
\+ {fprintf(yyout, "PLUS FOUND\n"); return PLUS;}
\- {fprintf(yyout, "MINUS FOUND\n"); return MINUS;}

    /* Relational Operators*/
= {fprintf(yyout, "EQUAL FOUND\n"); return EQUAL;}
[<][>] {fprintf(yyout, "NOTEQUAL FOUND\n"); return NOTEQUAL;}
[<]= {fprintf(yyout, "LESSEQUAL FOUND\n"); return LESSEQUAL;}
[>]= {fprintf(yyout, "GREATEREQUAL FOUND\n"); return GREATEREQUAL;}
[<] {fprintf(yyout, "LESSTHAN FOUND\n"); return LESSTHAN;}
[>] {fprintf(yyout, "GREATERTHAN FOUND\n"); return GREATERTHAN;}

    /* Logical Operators */
NOT {fprintf(yyout, "NOT FOUND\n"); return NOT;}
AND {fprintf(yyout, "AND FOUND\n"); return AND;}
OR {fprintf(yyout, "OR FOUND\n"); return OR;}
XOR {fprintf(yyout, "XOR FOUND\n"); return XOR;}

    /*Variables and Literals */
\"[^\"]*\" {fprintf(yyout, "STRING_LITERAL FOUND\n"); return STRING_LITERAL;}
[0-9]+\.[0-9]+ {fprintf(yyout, "FLOAT_NUM FOUND\n"); return FLOAT_NUM;}

[A-Z][0-9]?\$ {fprintf(yyout, "STRING_VARNAME FOUND\n"); return STRING_VARNAME;}

    /* [A-Z]\( {fprintf(yyout, "AR_VARNAME FOUND\n"); return AR_VARNAME;} */
    /* Four types of Integer Varname Possible: A, A%, A9, A9% */
[A-Z][0-9][%]? {fprintf(yyout, "INT_VAR FOUND\n"); return INT_VAR;}
[A-Z][%] {fprintf(yyout, "INT_VAR FOUND\n"); return INT_VAR;}

[A-Z][0-9]?[!#] {fprintf(yyout, "PRECISION_VAR FOUND\n"); return PRECISION_VAR;}

    /* A-Z could be a letter or int varname. We will check this in grammar */
[A-Z] {fprintf(yyout, "LETTER FOUND\n"); return LETTER;}


    /* Special Characters */
, {fprintf(yyout, "COMMA FOUND\n"); return COMMA;}
; {fprintf(yyout, "SEMICOLON FOUND\n"); return SEMICOLON;}
\n {fprintf(yyout, "NEWLINE FOUND\n"); return NL;}
[ ]+          /* do nothing */
%%
