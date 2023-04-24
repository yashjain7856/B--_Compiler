%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}


%%
    /* Line number or number */
[0-9]+ {yylval=atoi(yytext); printf("NUM FOUND: %d\n",yylval); return NUM;}

    /* Statement Type */
PRINT {printf("PRINT FOUND\n");return PRINT;}
END {printf("END FOUND\n"); return END;}
REM {printf("REM FOUND\n"); return REM;}

    /* Arithmetic Operators */
\( {return LPAR;}
\) {return RPAR;}
\^ {return EXPO;}
\* {return MUL;}
\/ {return DIV;}
\+ {return PLUS;}
\- {return MINUS;}

    /* Relational Operators*/
= {return EQUAL;}
[<][>] {return NOTEQUAL;}
[<]= {return LESSEQUAL;}
[>]= {return GREATEREQUAL;}
[<] {return LESSTHAN;}
[>] {return GREATERTHAN;}

    /* Logical Operators */
NOT {return NOT;}
AND {return AND;}
OR {return OR;}
XOR {return XOR;}

, {return COMMA;}
; {return SEMICOLON;}
\n {printf("NEWLINE FOUND\n"); return NL;}
[ ]+          /* do nothing */
%%
