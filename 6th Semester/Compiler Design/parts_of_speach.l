%{
#include <stdio.h>;
%}

%%
am|is|are|was|were|go		{printf("%s is a verb\n",yytext);}

very|simply|quickly|gently	{printf("%s is a adverb\n",yytext);}

to|from				{printf("%s is a preposition\n",yytext);}

behind|between			{printf("%s is a adverb,preposition\n",yytext);}

then				{printf("%s is a adjective,adverb\n",yytext);}

if				{printf("%s is a conjunction\n",yytext);}

[a-zA-Z]+			{printf("%s not recognized\n",yytext);}
%%

main()
{
yylex();
return 0;
}
