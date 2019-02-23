%token INTEGER VARIABLE
%left '+' '-'
%left '*' '/'
%{
void yyerror(char *);
int yylex(void);
int sym[26];
%}
%%
program:
program statement '\n'
|
;
statement:
expr
| VARIABLE '=' expr
;
{ printf("%d\n", $1); }
{ sym[$1] = $3; }
expr:
INTEGER
| VARIABLE
| expr '+'
| expr '-'
| expr '*'
| expr '/'
| '(' expr
;
{
{
{
{
{
{
expr
expr
expr
expr
')'
%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
return 0;
}
int main(void) {
yyparse();
return 0;
}
