digits [0-9]
relational ">="|"<="|"=="|">"|"<"
keywords "if"|"return"|"print"|"def"|"else" 
operators [+\-\*\/]
characters [a-z]
spec "("|")"|":"
%{
#include<string.h>
#include<stdio.h>
int dig = 0, rel = 0, key = 0, op = 0, spec = 0, chars = 0; 
%}
%%
{digits}+ { printf("%s : Number\n",yytext); }
{characters} { printf("%s : Variable\n",yytext); }
{keywords} { printf("%s : Keyword\n",yytext); }
{operators} {  printf("%s : Operator\n",yytext); }
{spec} {  printf("%s : Construct\n",yytext); }
{relational} { printf("%s : Relational Operator\n",yytext); }
%%
int main(void){
FILE *fp = fopen("python.txt","r");
if( fp )
	yyin = fp;
yylex();
return 0;
}

