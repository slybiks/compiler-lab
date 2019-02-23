%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token ID NID
%%

program:
        ID { printf("Identifer\n"); }
	| NID { printf("Not an identifier\n"); }
        ;
%%
void yyerror(char *s){
fprintf(stderr,"%s\n",s);
}

