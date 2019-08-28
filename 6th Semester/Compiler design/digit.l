%{ 

%} 

%% 
[0-9] {printf("%s is a digit\n", yytext); 
      } 
.     
%% 
int yywrap(){} 

int main(){ 
    
yylex(); 
  
return 0; 
} 