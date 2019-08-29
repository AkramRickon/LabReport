%{ 

%} 

%% 
(-)*[0-9]+ {printf("%s is an integer\n", yytext); 
      } 
.*      {printf("%s is not an integer\n", yytext);}
%% 
int yywrap(){} 

int main(){ 
    
yylex(); 
  
return 0; 
} 