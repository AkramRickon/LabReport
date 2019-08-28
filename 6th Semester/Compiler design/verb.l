%{
#include <stdio.h>;
%}
%%
am|is|are|was|were    {printf("%s is a verb\n",yytext);}
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