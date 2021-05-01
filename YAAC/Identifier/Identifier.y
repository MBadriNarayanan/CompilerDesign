%{
#include<stdio.h>
int valid=1;
int yylex();
int yyerror();
%}
%token digit letter
%%
start : letter s
s : letter s
| digit s
|
;
%%