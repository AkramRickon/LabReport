%{
int count; 
/* -----you can write any comments here-------
*  program to recognize the keywords
*/
%}

%%
 [%\t ] +         /* "+" indicates zero or more and this pattern use for ignoring the whitespaces*/

auto|
double|
if|
static|
break|
else|
int|
struct|
case|
enum|
long|
switch|
char|
extern|
near|
typedef|
const|
float|
continue|
register|
union|
unsigned|
void|
while|
default|
do|
goto|
signed|
while|signed|unsigned  {printf("C keyWord(%d) :\t %s",count,yytext);
[a-zA-Z]+ { printf("%s: is not the Keyword\n", yytext); 
 %%
 main( )
{
yylex();
}