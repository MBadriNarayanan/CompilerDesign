%{
#include<stdio.h>
#include "y.tab.h"
int valid;
int yyparse();
int yylex();
int yyerror();
%}
%%
[a-zA-Z_][a-zA-Z_0-9]* return letter;
[0-9] return digit;
. return yytext[0];
\n return 0;
%%
int yywrap()
{
    return 1;
}
int yyerror()
{
    printf("\nNot an Identifier!\n");
    valid=0;
    return 0;
}
int main()
{
    printf("\n\nRecognise identifier that starts with a letter followed by number or digits\n\n");
    printf("Enter a name to tested for identifier: ");
    yyparse();
    if(valid)
    {
        printf("\nIt is an Identifier!\n");
    }
    printf("\n\nThe End\n\n");
    return(0);
}