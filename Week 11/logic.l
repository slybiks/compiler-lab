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
[-()] return *yytext;
[<>\n] return *yytext;
">=" return GE;
"<=" return LE;
"==" return EQ;
"!=" return NE;
"&&" return AND;
"!" return NOT;
"||" return OR;
[ \t]+ ;
. yyerror("invalid character");
%%
int yywrap(void) {
return 1;
}
int main(void) {
yyparse();
return 0; 
}

