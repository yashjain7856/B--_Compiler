%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}


%%
    /* Line number or number */
[0-9]+ {yylval=atoi(yytext); printf("NUM FOUND: %d\n",yylval); return NUM;}

    /* Statement Type */
DATA {printf("DATA FOUND\n"); return DATA;}
DEF {printf("DEF FOUND\n"); return DEF;}
DIM {printf("DIM FOUND\n"); return DIM;}
END {printf("END FOUND\n"); return END;}
FOR {printf("FOR FOUND\n"); return FOR;}
TO {printf("TO FOUND\n"); return TO;}
STEP {printf("STEP FOUND\n"); return STEP;}
NEXT {printf("NEXT FOUND\n"); return NEXT;}
GOSUB {printf("GOSUB FOUND\n"); return GOSUB;}
GOTO {printf("GOTO FOUND\n"); return GOTO;}
IF {printf("IF FOUND\n"); return IF;}
THEN {printf("THEN FOUND\n"); return THEN;}
LET {printf("LET FOUND\n"); return LET;}
INPUT {printf("INPUT FOUND\n"); return INPUT;}
PRINT {printf("PRINT FOUND\n");return PRINT;}
REM {printf("REM FOUND\n"); return REM;}
RETURN {printf("RETURN FOUND\n"); return RETURN;}
STOP {printf("STOP FOUND\n"); return STOP;}

    /* Arithmetic Operators */
\( {printf("LPAR FOUND\n"); return LPAR;}
\) {printf("RPAR FOUND\n"); return RPAR;}
\^ {printf("EXPO FOUND\n"); return EXPO;}
\* {printf("MUL FOUND\n"); return MUL;}
\/ {printf("DIV FOUND\n"); return DIV;}
\+ {printf("PLUS FOUND\n"); return PLUS;}
\- {printf("MINUS FOUND\n"); return MINUS;}

    /* Relational Operators*/
= {printf("EQUAL FOUND\n"); return EQUAL;}
[<][>] {printf("NOTEQUAL FOUND\n"); return NOTEQUAL;}
[<]= {printf("LESSEQUAL FOUND\n"); return LESSEQUAL;}
[>]= {printf("GREATEREQUAL FOUND\n"); return GREATEREQUAL;}
[<] {printf("LESSTHAN FOUND\n"); return LESSTHAN;}
[>] {printf("GREATERTHAN FOUND\n"); return GREATERTHAN;}

    /* Logical Operators */
NOT {printf("NOT FOUND\n"); return NOT;}
AND {printf("AND FOUND\n"); return AND;}
OR {printf("OR FOUND\n"); return OR;}
XOR {printf("XOR FOUND\n"); return XOR;}

    /*Variables and Literals */
\"[^\"]*\" {printf("STRING_LITERAL FOUND\n"); return STRING_LITERAL;}
[A-Z][0-9]?\$ {printf("STRING_VARNAME FOUND\n"); return STRING_VARNAME;}
[A-Z]\( {printf("AR_VARNAME FOUND\n"); return AR_VARNAME;}
[A-Z][0-9]?[%!#]? {printf("VARNAME FOUND\n"); return VARNAME;}

    /* Special Characters */
, {printf("COMMA FOUND\n"); return COMMA;}
; {printf("SEMICOLON FOUND\n"); return SEMICOLON;}
\n {printf("NEWLINE FOUND\n"); return NL;}
[ ]+          /* do nothing */
%%
