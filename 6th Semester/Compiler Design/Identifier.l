%{
#include <stdio.h>
%}
digit[0-9]
letter[a-zA-Z_]

%%

{letter}({letter}|{digit})* {printf("%s is Identifier\n",yytext);}
.*  {printf("Invalid Identifier\n");}
%%
main()
{
yylex();
return 0;
}
int yywrap()
{
}