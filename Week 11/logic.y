%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token INTEGER
%left GE LE EQ NE '>''<'
%left NOT AND OR
%nonassoc UMINUS
%%
program:
program expr '\n' { printf("%d\n",$2); }
|
;
expr:
INTEGER 	{ $$ = $1; }
| expr '<' expr { $$ = $1 < $3; }
| expr '>' expr { $$ = $1 > $3; }
| expr AND expr { $$ =  $1 && $3; }
| NOT expr { $$ =  !$$; }
| expr OR expr { $$ =  $1 || $3; }
| expr GE expr { $$ = $1 >= $3; }
| expr LE expr { $$ = $1 <= $3; }
| expr EQ expr { $$ = $1 == $3; }
| expr NE expr { $$ = $1 != $3; }
| '(' expr ')'  { $$ = $2;  }
| '-' expr %prec UMINUS { $$ = -$2; } 
;
%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
