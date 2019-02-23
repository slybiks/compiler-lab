%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
%%
[0-9]+ {
yylval = atoi(yytext);
return INTEGER;
}
[()] return *yytext;
[-+*/\n] return *yytext;
[ \t] ;
. yyerror("invalid character");
%%
int yywrap(void) {
return 1;
}
int main(void) {
yyparse();
return 0; 
}
