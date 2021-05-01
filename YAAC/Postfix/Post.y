%{
	#include<stdio.h>
	float output=0;
	int yylex();
	void yyerror(const char *s);
	int yyparse();
%}
%union
{
	float dval;
}
%token <dval> NUMBER
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%type <dval> state
%type <dval> exp
%type <dval> N
%%
state : exp N {};
exp : NUMBER {$$=$1;output=$$;}
| exp exp '+' {$$=$1+$2;output=$$;}
| exp exp '-' {$$=$1-$2;output=$$;}
| exp exp '*' {$$=$1*$2;output=$$;}
| exp exp '/' {$$=$1/$2;output=$$;}
;
N : {printf("Output = %0.2f\n",output);}
;
%%