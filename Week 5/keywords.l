%{
#include<string.h>
#include<stdio.h>
%}
%%
"if"|"return"|"else"|"def"|"print" { int i = 0;
printf("Lower case : %s\t",yytext);
char buffer[50];
memset(buffer,'\0',sizeof(buffer));
strcpy(buffer,yytext);
for(i = 0; i < strlen(buffer); i++){
buffer[i] = buffer[i]-32;
}
printf(" Upper Case : %s\n",buffer);
REJECT;
}
. { continue; }
%%
int main(void){
FILE *fp = fopen("python.txt","r");
if( fp )
	yyin = fp;
yylex();
return 0;
}

