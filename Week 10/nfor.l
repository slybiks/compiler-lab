%{
#include<stdlib.h>
#include<string.h> 
void yyerror(char *);
#include "y.tab.h"
int loopcount = 0, loopclose = 0;
char loop[200];
%}
%%
("for("(.)*";"(.)*";"(.)*"){")+|("while("(.)*"){")+    {  ++loopcount;  }
[}]   {  ++loopclose;  }
[\r\n]     { if(loopclose == loopcount) {
	  
		yylval = *yytext;
	  	return LOOP; 
       		
		}
           }
. { yylval = *yytext; return NLOOP; }
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
