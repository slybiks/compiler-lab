concat ^(ab)+$
%{
#include<stdio.h>
%}
%%
{concat} { ECHO; printf(" occurence found"); }
%%
int main(void)
{
yylex();
return 0;
}
