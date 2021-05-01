%{
	#include<stdio.h>
	int lines = 0;
	int words = 0;
	int lc = 0;
	int uc = 0;
	int digits = 0;
	int spl_char = 0;
	int total = 0;
%}
%%
\n { lines++; words++;}
[\t''] words++;
[A-Z] uc++;
[a-z] lc++;
[0-9] digits++;
. spl_char++;
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
        fprintf(stderr,"File not found! \n");
        return 1;
    }
    yylex();
    total = lc + uc + spl_char;
    printf("\n\nCharacter Count, Word Count and Line Count \n\n");
    printf("Lower Case Characters Count: %d \n", lc);
    printf("Upper Case Characters Count: %d \n", uc);
    printf("Special Characters Count: %d \n", spl_char);
    printf("Digits Count: %d \n", digits);
    printf("Character Count (Lower case characters + Upper case characters + Special characters): %d \n", total);
    printf("Line Count: %d \n", lines);
    printf("Word Count: %d \n", words);
    printf("\n\nThe End \n\n");
}
 
int yywrap()
{
	return(1);
}