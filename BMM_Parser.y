%{
#include <stdio.h>
extern FILE *yyin;
void yyerror(const char *str)
{
	fprintf(stderr,"Invalid String: %s\n", str);
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
int power_cust(int a, int b){
	int res=1;
	for(int i=0;i<b;i++){
		res = res*a;
	}
	return res;
}

int printbuffer[100];
int printidx = 0;
%}

%token NUM NL COMMA SEMICOLON
%token PLUS MINUS MUL DIV EXPO LPAR RPAR 
%token EQUAL NOTEQUAL LESSTHAN GREATERTHAN LESSEQUAL GREATEREQUAL 
%token NOT AND OR XOR
%token PRINT REM END LET


%%
PROG: STMTS
	;

STMTS: STMT ENDSTMT
		| STMT STMTS
		;

ENDSTMT: NUM END {printf("PROGRAM ENDED\n");}
		;

STMT: PRINT_STMT
	;

PRINT_STMT: NUM PRINT NL
     		|NUM PRINT PRINT_EXPR1 NL {
				while(printidx--){
					printf("%d ", printbuffer[printidx]);
				}
				printf("\n");
	 		}
     		|NUM PRINT PRINT_EXPR2 NL
	 		;

PRINT_EXPR1: NUM_EXP {printbuffer[printidx]=$1; printidx++;}
      | NUM_EXP DEL PRINT_EXPR1 {printbuffer[printidx]=$1; printidx++;}
	  ;

PRINT_EXPR2: NUM_EXP DEL {$$=$1;}
     | NUM_EXP DEL PRINT_EXPR2 
	 ;

DEL: COMMA
	| SEMICOLON
	;

NUM_EXP :NUM_EXP PLUS TERM  	{$$=$1+$3;}
      |NUM_EXP MINUS TERM  	{$$=$1-$3;}
      |TERM	  	{$$=$1;}
      ;
     
TERM :TERM MUL FAC	{$$=$1*$3;}
      |TERM DIV FAC	{$$=$1/$3;}
      |FAC		{$$=$1;}
      ;

FAC: VAR EXPO VAR {$$=power_cust($1,$3);}
	| VAR {$$=$1;}
	;

VAR:NUM		{$$=$1;}
    |LPAR NUM_EXP RPAR	{$$=$2;}
    ;


%%