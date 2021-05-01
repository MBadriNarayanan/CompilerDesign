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
return NUMBER;
}
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
    printf("\nInvalid Arithmetic Expresion!\n");
    flag=1;
}
int main()
{
    printf("\n\nIdentify Valid Arithmetic Expression\n\n");
    printf("Enter Any Arithmetic Expression which can have operations(+,-,*,/): ");
    yyparse();
    if(flag == 0)
    {
        printf("\nValid Arithmetic Expression!\n");
    }
    printf("\n\nThe End\n\n");
    return(0);
}