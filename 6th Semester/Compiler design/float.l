%{ 

%} 

%% 
[.0-9]+ {printf("%s is a floating point number\n", yytext); 
      }
 .     
%% 
int yywrap(){} 

int main(){ 
    
yylex(); 
  
return 0; 
} 