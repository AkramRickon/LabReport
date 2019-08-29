%{ 

%} 

%% 
(-)*[0-9]+ {printf("%s is a real numberr\n", yytext); }
[-0-9]*\.[0-9]+ {printf("%s is a real number\n", yytext); 
      } 
.*      {printf("%s is not a real number\n", yytext);}
%% 

int yywrap(){} 

int main(){ 
yylex(); 
return 0; 
} 