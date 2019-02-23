%{
#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
%%
[a-zA-Z]([a-zA-Z]|[0-9])* { 
	    			yylval = *yytext; 
	    			return ID;

       			   }
.  { yylval = *yytext; return NID; } 
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
