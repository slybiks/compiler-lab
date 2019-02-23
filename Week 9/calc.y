%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token INTEGER VARIABLE
%left '+''-'
%left '*''/'
%nonassoc UMINUS
%%
program:
program expr '\n' { printf("%d\n",$2); }
|
;
expr:
INTEGER 	{ $$ = $1; }
| expr '+' expr { $$ = $1 + $3; }
| expr '-' expr { $$ = $1 - $3; }
| expr '*' expr { $$ = $1 * $3; }
| expr '/' expr { $$ = $1 / $3; }
| '(' expr ')'  { $$ = $2;  }
| '-' expr %prec UMINUS { $$ = -$2; } 
;
%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
