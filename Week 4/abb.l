pair (a*b*)*
%{
#include <stdio.h>
#include <string.h>
%}
%%
^{pair}$ { int i;
int flag = 0;
for( i = 0; i < yyleng-2; i++){
if( yytext[i] == 'a' && yytext[i+1] == 'b' && yytext[i+2] == 'b'){
flag = 1;
break; 
}
}
if ( flag == 0 )
printf("\n%s does not contain abb's\n",yytext);
}
%%
int main(void){
yylex();
return 0;
}

