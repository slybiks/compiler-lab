letter [a-z]
digit [0-9]
space [\n\t]+
operator [+-/*]
%{
#include<stdio.h>
#include<string.h>
%}
%%
"while" { 
printf("%s","for");
}
[(](.)+[)] {
printf("%s","(; x < 3; x++)");
}
{letter}(.)+{operator}(.)+{digit}; { 
memset(yytext,'\0',sizeof(yytext));
printf("%s",yytext);
}
. { printf("%s",yytext); }
%%
int main(void){
FILE *fp = fopen("wtof.txt","r");
if( fp )
	yyin = fp;
yylex();
return 0;
}
