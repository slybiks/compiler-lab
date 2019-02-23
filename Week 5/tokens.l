characters [a-z]
whitespace [\n\t]+
operator [+\=]
%{
#include<string.h>
#include<stdio.h>
int ident = 0, inc = 0, operator = 0; 
%}
%%
{characters} { ident++; printf("%s : identifier\n",yytext); }
{whitespace}?{characters}(\+\+){whitespace}? { inc++; printf("++: pre-increment-operator\n"); }
{whitespace}?(\+\+){characters}{whitespace}? { inc++; printf("++ : post-increment-operator\n"); }
{operator} { operator++; printf("%s : operator\n",yytext); }
{whitespace} { REJECT; continue; }
%%
int main(void){
yylex();
printf("Identifiers : %d\n",ident);
printf("Increment operator : %d\n",inc);
printf("Operators : %d\n",operator);
return 0;
}
 
