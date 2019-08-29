%{ 
#include<stdio.h>
%} 

%% 
[0-9] {printf("%s is a digit\n", yytext); } 
.     printf("Not Digit\n");
%% 
int yywrap(){} 

int main(){ 
    
yylex(); 
  
return 0; 
} 