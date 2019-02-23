%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token INTEGER
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%%
program:
        program statement '\n' { printf("Expression evaluates to : %d\n",$2); }
        |
        ;
statement:
        expr1 {printf("\nInfix expression.\n");}
        | expr2 {printf("\nPrefix expression.\n");}
        | expr3 {printf("\nPostfix expression.\n");}
        ;
expr1: 
        INTEGER { $$ = $1; }
        | expr1 '+' expr1 { $$ = $1 + $3;}
        | expr1 '-' expr1 { $$ = $1 - $3; }
        | expr1 '*' expr1 { $$ = $1 * $3; }
        | expr1 '/' expr1 { $$ = $1 / $3; }
        ;
expr2:
        INTEGER { $$ = $1; }     
        | '+' expr2 expr2 { $$ = $2 + $3; }
        | '-' expr2 expr2 { $$ = $2 - $3; }
        | '*' expr2 expr2 { $$ = $2 * $3; }
        | '/' expr2 expr2 { $$ = $2 / $3; }
        ;
expr3:
        INTEGER { $$ = $1; }
        | expr3 expr3 '+' { $$ = $1 + $2; }
        | expr3 expr3 '-' { $$ = $1 - $2; }
        | expr3 expr3 '*' { $$ = $1 * $2; }
	| expr3 expr3 '/' { $$ = $1 / $2; }
        ;                                                                              
%%
void yyerror(char *s){
fprintf(stderr,"%s\n",s);
}

