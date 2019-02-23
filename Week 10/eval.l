%{
#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
%%
[0-9] {
             yylval = atoi(yytext);
             return INTEGER;
     }
[-+*/\n] return *yytext;
[()] return *yytext;
[ \t] ;
%%

int yywrap(void)
{
return 1;
}

int main(char *argc, char *argv)
{
yyparse();
return 0;
}
