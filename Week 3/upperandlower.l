lowercase [a-z]
uppercase [A-Z]
%{
#include <stdio.h>
int lcase=0,ucase=0,character=0;
%}
%%
{lowercase} { ECHO; lcase++; }
{uppercase} { ECHO; ucase++; }
. { ECHO; character++; }
%%
int main(){
yylex();
printf("Lower and upper case %d %d\n",lcase,ucase);
printf("Characters %d\n",character);
return 0;
}



