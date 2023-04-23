%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
END {printf("Program Ended\n");}
[0-9]+[ ]+PRINT {return PR;}
[0-9]+ {yylval=atoi(yytext); return NUM;}
\( {return LPAR;}
\) {return RPAR;}
\+ {return ADD;}
- {return SUB;}
\* {return MUL;}
\/ {return DIV;}
\n {return NL;}
;|: {return DEL;}
[ ]+          /* do nothing */
%%
