%{
#include <stdio.h>;
%}
%%
am|is|are|was|were    {printf("%s is a verb\n",yytext);}
beautiful    {printf("%s is a adjective\n",yytext);}
slowly|simply {printf("%s is a adverb\n",yytext);}
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