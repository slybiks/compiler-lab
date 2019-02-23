%{
#include<stdio.h>
#include<string.h>
%}
%%
(.)+ {
yyless(3);
printf("%s\n",yytext);
} 
%%
int main(void)
{
yylex();
return 0;
}
