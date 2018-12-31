lowercase [a-z]
uppercase [A-Z]
delimiters [\n]
%{
#include <stdio.h>
int key=0,relop=0,spec=0,chars=0,words=0,lines=0,lcase=0,ucase=0;
%}
%%
"if"|"then"|"else"|"for"|"while"|"int"|"float"|"real" { ECHO; key++; }
[!@#$%^&*]|"()" { ECHO; spec++; }
"<"|">"|"<>"|">="|"=" { ECHO; relop++; }
(\t)?[a-zA-Z]+(\t)? { ECHO; words++; }
{delimiters} { ECHO; lines++; }
%%
int main(){
yylex();
printf("Keywords %d\n",key);
printf("Relational operators %d\n",relop);
printf("Special characters %d\n",spec);
printf("Words and lines %d %d\n",words,lines);
return 0;
}



