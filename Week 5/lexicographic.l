characters [a-z]
%{
#include<stdio.h>
#include<string.h>
%}
%%
{characters}+ {
int i,j; 
char temp;
for(i = 0; i < yyleng-1; i++){
	for(j = 0; j < yyleng-1-i; j++){
		if(yytext[j] > yytext[j+1]){
			temp = yytext[j+1];
			yytext[j+1] = yytext[j];
			yytext[j] = temp;
		}
	}
}	
printf("%s\n",yytext);
}
. { continue; }
%%
int main(void){
yylex();
return 0;
}
