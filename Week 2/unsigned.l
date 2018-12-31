digits [0-9]
sign [+-]
exponent [Ee]
%{
#include<stdio.h>
%}
%%
^({digits}+(\.{digits}+)?({exponent}{sign}?{digits}+)?)$ { ECHO; printf(" is an unsigned number"); }
^{exponent}{sign}?{digits}+$ { ECHO; printf(" is an unsigend number"); }
^\.{digits}+({exponent}{sign}?{digits}+)?$ { ECHO; printf(" is an unsigned number"); }
^\.{exponent}{sign}?{digits}+$ { ECHO; printf(" is an unsigned number"); }
%%
int main(){
yylex();
return 0;
}
