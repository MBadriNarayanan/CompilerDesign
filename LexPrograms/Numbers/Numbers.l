%{
#include <stdio.h>
#include <string.h>
int integer = 0;
int floating = 0;
%}
%%
[1-9][0-9]*\.[0-9]* {floating++;}
[1-9][0-9]* {integer++;}
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
    printf("\n\nCounting Integers and Floating point numbers\n\n");
    printf("Number of integers: %d\n", integer);
    printf("Number of floating point: %d\n", floating);
    printf("\n\nThe End\n\n");
}