case "case"
%{
#include<stdio.h>
#include<string.h>
int j = 1;
%}
%%
"switch" {
printf("%s","if");
}
"default:" {
printf("%s","else");
}
"break;" {
memset(yytext,'\0',yyleng);
}
^{case}(.)+:$ {
char buffer[50];
memset(buffer,'\0',sizeof(buffer));
strcpy(buffer,"value");
if( j == 1 ){
	strcpy(yytext,"if(");
	strcat(yytext,buffer);
}
else {
	strcpy(yytext,"else if(");
	strcat(yytext,buffer);
}
printf("%s",yytext);
printf("%d",j);
printf("%s",")");
j++;
}	
%%
int main(void){
FILE *fp = fopen("stoif.txt","r");
if( fp )
	yyin = fp;
yylex();
return 0;
}
