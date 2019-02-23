whitespace [\n\t]+
operator [+\-\*\/]
digit [0-9]
letter [a-z]
%{
#include <stdio.h>
#include <string.h>
int ident = 0, number = 0, space = 0, assign = 0, oper = 0; 
%}
%%
{letter}* { if( yytext[0] >= 97 && yytext[0] <= 122) { yytext[0] = yytext[0] - 32; printf("%s, ",yytext); } REJECT; }
({letter}|"_")({letter}|{digit})* {  ++ident; }
{digit}+ { ++number; }
{whitespace} { ++space; } 
:= { ++assign; }
{operator}+ { ++oper; }
. { continue; }
%%
int main(){
FILE *fp = fopen("input.txt","r");
char buffer[1000],c;
memset(buffer,'\0',sizeof(buffer));
c = fgetc(fp);

while( c != EOF ){
printf("%c",c);
c = fgetc(fp);
}
fclose(fp);
FILE *f = fopen("input.txt","r");
if ( f )
   yyin = f;
yylex();
printf("\nThere are %d identifiers\n",ident);
printf("There are %d numbers\n",number);
printf("There are %d whitespaces\n",space);
printf("There are %d assignment operators\n",assign);
printf("There are %d operators\n",oper);
return 0;
}
