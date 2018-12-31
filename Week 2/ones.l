digit [0-9]*
sign [+-]?
%{
#include<stdio.h>
%}
%%
^{sign}{digit}$ { ECHO; printf(" is expected"); }
%%
int main(void)
{
yylex();
return 0;
}
