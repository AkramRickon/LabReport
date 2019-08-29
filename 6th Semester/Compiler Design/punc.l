%option noyywrap
%{
	#include<stdio.h>
%}

%%
;|!|,|%|-|:|' {printf("%s is a punctuation mark\n",yytext);}
.* printf("Not punction");
%%

int main()
{
yylex();
return 0;
}