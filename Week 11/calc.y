%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token LETTER DIGIT
%left '+''-'
%left '*''/'
%nonassoc UMINUS
%%
program:
program stmt '\n'
|
;
stmt:
expr { printf("%d\n",$$); }
|
;
expr:
DIGIT  { $$ = $1; }
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
int main(void){
yyparse();
return 0;
}
int yylex(void){
int c;
while( (c = getchar()) == ' ')
{ }
if(isdigit(c)){
yylval = c - '0';
return DIGIT;
}
return c;
}
