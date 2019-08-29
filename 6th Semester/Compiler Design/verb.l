%{
#include <stdio.h>
%}
%%
[\t]+
am|is|are|was|were|be|being|been|do|does|did|will|would|should|can|could|has|go|have    {printf("%s is a verb\n",yytext);}
[a-zA-Z]+  {printf("%s is a not verb\n",yytext);}

%%
main()
{
yylex();
return 0;
}

int yywrap()
{
}