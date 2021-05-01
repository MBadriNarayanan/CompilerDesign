%{
#include<stdio.h>
#include "y.tab.h"
extern int yylval;
int flag;
int yyparse();
%}
%%
[0-9]+ {
yylval=atoi(yytext);
return NUMBER; }
[\t] ;
[\n] return 0;
. return yytext[0];
%%
int yywrap()
{
    return 1;
}
void yyerror()
{
    printf("\n Invalid Expression \n\n");
    flag=1;
}
int main()
{
    printf("\n\nArithmetic Calculator \n\n");
    printf("\nEnter an Arithmetic Expression: ");
    yyparse();
    printf("\n\nThe End \n\n");
    return 1;
}