%{
#include<stdio.h>
#include<string.h>
%}
%%
"for"(.)+"{" {
printf("%s\n","init;");
strcpy(yytext,"do");
printf("%s",yytext);
REJECT;
}
"{" {
printf("%s",yytext);
}
"}" {
printf("%s",yytext);
printf("%s","while(condition);");
}
"statement(s);" {
printf("%s",yytext);
printf("\n%s","increment;");
}
. 
%%
int main(void){
FILE *fp = fopen("nested.txt","r");
if ( fp )
	yyin = fp;
yylex();
return 0;
}
