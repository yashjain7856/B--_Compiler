%{
#include <stdio.h>
void yyerror(const char *str)
{
	fprintf(stderr,"Invalid String\n");
}
int yywrap()
{
	return 1;
}
int main()
{
	yyparse();
	return 0;
}
%}
%token NL


%%
EXP :NL     	{printf("Newline Found!"); return 0;} 
    ;

%%