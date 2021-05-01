%{
#include<stdio.h>
#include"y.tab.h"
#include<math.h>
int yyparse();
%}
%%
[0-9] {yylval.dval=atof(yytext); return NUMBER;}
[t];
n return 0;
. {return yytext[0];}
%%
void yyerror(char * str)
{
	printf("\nInvalid Expression! \n");
}
int main(int argc, char **argv)
{ 
    printf("\n\nEvaluate Postfix Expression \n\n");
    if(argc != 2)
    {
        fprintf(stderr,"Please Enter file as second argument!\n");
        return 1;
    }
    yyin = fopen(argv[1], "rt");
    if(yyin == NULL)
    {
        fprintf(stderr,"File not found!\n");
        return 1;
    }
    yyparse();
    printf("\n\nThe End\n\n");
    return(0);
}