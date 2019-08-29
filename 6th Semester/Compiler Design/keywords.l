%{
#include <stdio.h>
%}
%%
if|for|int|char|while|else|float|double|switch   {printf("%s is a keyword\n",yytext);}
.

%%
main()
{
yylex();
return 0;
}
int yywrap()
{
}