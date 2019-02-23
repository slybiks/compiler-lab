%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token LOOP NLOOP
%%

program:
        LOOP { printf("Valid looping construct\n"); } 
	| NLOOP { }
        ;
%%
void yyerror(char *s){
fprintf(stderr,"%s\n",s);
}

