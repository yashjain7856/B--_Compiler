%{
#include <stdio.h>
extern FILE *yyin;
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
	yyin = fopen("test.txt","r");
	yyparse();
	return 0;
}
int printbuffer[100];
int printidx = 0;

%}

%token PR NUM ADD SUB MUL DIV LPAR RPAR NL DEL


%%
PRI: PR NL
     |PR EXP1 NL {
		while(printidx--){
			printf("%d ", printbuffer[printidx]);
		}
		printf("\n");
	 }
     |PR EXP2 NL
	 ;

EXP1: EXP {printbuffer[printidx]=$1; printidx++;}
      | EXP DEL EXP1 {printbuffer[printidx]=$1; printidx++;}
	  ;

EXP2: EXP DEL {$$=$1;}
     | EXP DEL EXP2 
	 ;

EXP :EXP ADD TERM  	{$$=$1+$3;}
      |EXP SUB TERM  	{$$=$1-$3;}
      |TERM	  	{$$=$1;}
      ;
     
TERM :TERM MUL FAC	{$$=$1*$3;}
      |TERM DIV FAC	{$$=$1/$3;}
      |FAC		{$$=$1;}
      ;
     
FAC:NUM		{$$=$1;}
        |LPAR EXP RPAR	{$$=$2;}
       ;
%%