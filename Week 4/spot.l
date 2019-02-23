digits [0-9]+
pair (a*b*)*
letter [a-zA-Z]
%{
#include <stdio.h>
int numbers=0,pairs=0,vowels=0;
%}
%%
^{digits}$ {int i, count = 0;
int occurrence[10];
memset(occurrence,0,sizeof(occurrence));
for(i= 0; i < yyleng; i++){
int temp = yytext[i]-'0';
occurrence[temp]++;
}
for( i = 0; i < 10; i++ ){
if( occurrence[i] > 1 )
	++count;
}
if( count == 0 )
printf("%s is a string with no repeated digit\n",yytext);
}
{letter}*((abb)|(ABB)|(abB)|(AbB)|(ABb)|(aBb)|(aBB)){letter}* {  continue; }
{letter}* { printf("%s does not contain abb's",yytext); }
^(b|B)(.)*(s|S)$ { printf("\n%s starts with b and ends with s\n",yytext);}
%%
int main(void){
yylex();
return 0;
} 
