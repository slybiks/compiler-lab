expr [A-Za-z0-9+-/*]
%{
#include<stdio.h>
#include<string.h>
char match[100],operator[20],stack[20],operand[20];
int idx=-1,top=-1,reverse=-1;
%}
%%
{expr}* {
int i,k;
memset(match,'\0',sizeof(match));
memset(stack,'\0',sizeof(stack));
memset(operator,'\0',sizeof(operator));
memset(operand,'\0',sizeof(operand));
strcpy(match,yytext);
for(k = 0; k < yyleng; k++){
	if(match[k] == '+' || match[k] == '*' || match[k] == '/' || match[k] == '-')
		stack[++top] = match[k];
	else
		operand[++idx] = match[k];
}
for(i = top; i >= 0; i--)
	operator[++reverse] = stack[i];
i = 0;
while( operator[i] != '\0' || operand[i] != '\0' ){
if( operand[i] != '\0')
	printf("%c",operand[i]);
if( operator[i] != '\0')
	printf("%c",operator[i]);
i++;
}
}
%%
int main(){
yylex();
return 0;
}




	
