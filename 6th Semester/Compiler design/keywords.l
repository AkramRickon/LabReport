%{
#include <stdio.h>;
%}
%%
if|for|int|char|while    {printf("%s is a keyword\n",yytext);}
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