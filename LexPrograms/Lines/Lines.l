%{
#include <stdio.h>
#include <string.h>
int lines = 0;
%}
%%
\n {lines++;}
. {;}
%%
int main(int argc, char **argv)
{ 
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
    yylex();
    printf("\n\nLine Count\n\n");
    printf("Number of lines: %d\n", lines);
    printf("\n\nThe End\n\n");
}