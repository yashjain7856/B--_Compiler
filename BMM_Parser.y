%{
#include <stdio.h>
extern FILE *yyin, *yyout;

void yyerror(const char *str)
{
	fprintf(stderr,"Invalid String: %s\n", str);
}
int yywrap()
{
	return 1;
}

int lineNumber[1000] = {0};
int numLines = 0;

int ifLines[1000] = {0};
int numifs = 0;

int gotoLines[1000] = {0};
int numgotos = 0;

int gosubLines[1000] = {0};
int numgosubs = 0;

void pushLine(int a){
	lineNumber[numLines]=a; 
	numLines++;
}

void tmp(int a, int b){
	if(a>=b){
		printf("invalid sequence of line numbers: %d and %d\n",a,b);
	}
}

void checkifs(){
	for(int i=0;i<numifs;i++){
		int flag=0;
		for(int j=0;j<numLines;j++){
			if(ifLines[i]==lineNumber[j]){
				flag=1;
				break;
			}
		}
		if(flag==0){
			fprintf(yyout,"Line number %d called in IF statement NOT found !!!\n",ifLines[i]);
		}
	}
}

void checkgotos(){
	for(int i=0;i<numgotos;i++){
		int flag=0;
		for(int j=0;j<numLines;j++){
			if(gotoLines[i]==lineNumber[j]){
				flag=1;
				break;
			}
		}
		if(flag==0){
			fprintf(yyout,"Line number %d called in GOTO statement NOT found !!!\n",gotoLines[i]);
		}
	}
}


void checkgosubs(){
	for(int i=0;i<numgosubs;i++){
		int flag=0;
		for(int j=0;j<numLines;j++){
			if(gosubLines[i]==lineNumber[j]){
				flag=1;
				break;
			}
		}
		if(flag==0){
			fprintf(yyout,"Line number %d called in GOSUB statement NOT found !!!\n",gosubLines[i]);
		}
	}
}

int main(int argc, char* argv[])
{
	yyin = fopen(argv[1],"r");
	yyout = fopen("out.txt","w");
	yyparse();
	checkifs();
	checkgosubs();
	checkgotos();
	return 0;
}

%}

%token NUM NL COMMA SEMICOLON
%token PLUS MINUS MUL DIV EXPO LPAR RPAR 
%token EQUAL NOTEQUAL LESSTHAN GREATERTHAN LESSEQUAL GREATEREQUAL 
%token NOT AND OR XOR
%token DATA DEF FN DIM END FOR TO STEP NEXT GOSUB GOTO IF THEN LET INPUT PRINT REM RETURN STOP
%token STRING_LITERAL FLOAT_NUM STRING_VARNAME INT_VAR PRECISION_VAR LETTER

%%
PROG: STMTS
	;

STMTS: STMT END_STMT {tmp($1, $2); $$=$1; pushLine($1);}
		| STMT STMTS {tmp($1, $2); pushLine($1);}
		;

END_STMT: NUM END {$$=$1; pushLine($1);}
		;

STMT: NUM DATA_STMT NL {$$=$1;} 
	| NUM DEF_STMT NL {$$=$1;}
	| NUM DIM_STMT NL {$$=$1;}
	| NUM FOR_STMT NL {tmp($1, $2); $$=$1;}
	| NUM GOSUB_STMT NL {$$=$1;}
	| NUM GOTO_STMT NL {$$=$1;}
	| NUM IF_STMT NL {$$=$1;}
	| NUM LET_STMT NL {$$=$1;}
	| NUM INPUT_STMT NL {$$=$1;}
	| NUM PRINT_STMT NL {$$=$1;}
	| NUM REM_STMT NL {$$=$1;}
	| NUM RETURN_STMT NL {$$=$1;}
	| NUM STOP_STMT NL {$$=$1;}
	;

/* DATA Statement */
DATA_STMT: DATA CONSTANTS
			;

CONSTANTS: CONSTANT
			| CONSTANT COMMA CONSTANTS
			;

CONSTANT: NUM
			| FLOAT_NUM
			| STRING_LITERAL
			;

/* DEF Statement */
DEF_STMT: DEF FN LETTER EQUAL NUM_EXP
		| DEF FN LETTER LPAR LETTER RPAR EQUAL NUM_EXP
		;


/* DIM Statement */
DIM_STMT: DIM DECLARATIONS
		;

DECLARATIONS: DECL_STMT
			| DECL_STMT COMMA DECLARATIONS
			;

DECL_STMT: LETTER LPAR MAX_SUB RPAR
		;

MAX_SUB: NUM
		| NUM COMMA NUM
		;

/* FOR Statement */
FOR_STMT: FOR_HEADER NL FOR_INNER_STMTS {$$=$3;}
		;

FOR_HEADER: FOR NUMERIC_VAR EQUAL NUM_EXP TO NUM_EXP STEP NUM_EXP
			| FOR NUMERIC_VAR EQUAL NUM_EXP TO NUM_EXP
			;

FOR_INNER_STMTS: STMT NUM NEXT NUMERIC_VAR {tmp($1, $2); $$=$1; pushLine($2); pushLine($1); }
			| STMT FOR_INNER_STMTS {tmp($1, $2); $$=$1; pushLine($1);}
			;

WHOLE_VAR: INT_VAR
			| LETTER
			| ARRAY_ELEMENT
			;

NUMERIC_VAR: WHOLE_VAR
			| PRECISION_VAR
			;

ARRAY_ELEMENT: LETTER LPAR NUM RPAR
				| LETTER LPAR NUM COMMA NUM RPAR
				| LETTER LPAR WHOLE_VAR COMMA NUM RPAR
				| LETTER LPAR NUM COMMA WHOLE_VAR RPAR
				| LETTER LPAR WHOLE_VAR RPAR
				| LETTER LPAR WHOLE_VAR COMMA WHOLE_VAR RPAR
				;

/* GOSUB and GOTO */
GOSUB_STMT: GOSUB NUM {gosubLines[numgosubs]=$2; numgosubs++;}
			;

GOTO_STMT: GOTO NUM {gotoLines[numgotos]=$2; numgotos++;}
		;

/* IF Statement */
IF_STMT: IF CONDITION THEN NUM {ifLines[numifs]=$4; numifs++;}
		;

CONDITION: NUM_EXP RELOP NUM_EXP
			| STRINGS S_OP STRINGS
			;

STRINGS: STRING_LITERAL
		| STRING_VARNAME
		;

S_OP: EQUAL
	| NOTEQUAL
	;

RELOP: LESSTHAN
		| LESSEQUAL
		| EQUAL
		| GREATEREQUAL
		| GREATERTHAN
		| NOTEQUAL
		;

/* LET Statement */
LET_STMT: LET STRING_VARNAME EQUAL STRING_LITERAL
		| LET STRING_VARNAME EQUAL STRING_VARNAME
		| LET NUMERIC_VAR EQUAL NUM_EXP
		;

/* INPUT Statement */
INPUT_STMT: INPUT VAR_LIST
			;

VAR_LIST: VARIABLE
		| VARIABLE COMMA VAR_LIST
		;

VARIABLE: NUMERIC_VAR
		| STRING_VARNAME
		;

/* Print Statement */
PRINT_STMT: PRINT
     		| PRINT PRINT_EXPR1 
     		| PRINT PRINT_EXPR2
	 		;

PRINT_EXPR1: PRINT_EXPR
      | PRINT_EXPR DEL PRINT_EXPR1
	  ;

PRINT_EXPR2: PRINT_EXPR DEL
     | PRINT_EXPR DEL PRINT_EXPR2 
	 ;

PRINT_EXPR: NUM_EXP
			|STRINGS
			;

DEL: COMMA
	| SEMICOLON
	;

/* REM Statement */
REM_STMT: REM
		;

/* RETURN and STOP */
RETURN_STMT: RETURN
			;

STOP_STMT: STOP
		;



/* For Arithmetic Operations (Numeric Expression) */
NUM_EXP :NUM_EXP PLUS AA
      |NUM_EXP MINUS AA
      |AA
      ;
     
AA :AA MUL BB
      |AA DIV BB
      |BB
      ;

BB: MINUS BB
	|CC
	;

CC: CC EXPO DD
	|DD
	;

DD:NUM
	| FLOAT_NUM
	| NUMERIC_VAR
    | LPAR NUM_EXP RPAR
    ;

/* For Relational Operations */
/* REL_EXP :REL_EXP GREATEREQUAL R_AA
      |R_AA
      ;
     
R_AA :R_AA LESSEQUAL R_BB
      |R_BB
      ;

R_BB: R_BB GREATERTHAN R_CC
	| R_CC
	;

R_CC: R_CC LESSTHAN R_DD
	| R_DD
	;

R_DD: R_DD NOTEQUAL R_EE
	| R_EE
	;

R_EE: R_EE EQUAL R_FF
	| R_FF
	;

R_FF: NUM
	; */


%%