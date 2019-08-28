%{
#include <stdio.h>;
%}
%%
if|else|while|int|switch|for|char    {printf("%s is not identifier\n",yytext);}
[a-z]([a-z]|[0-9])*    {printf("%s is an identifier\n",yytext);}
[0-9]*        {printf("%s Not identifier\n",yytext);}
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