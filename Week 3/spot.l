digits [0-9]+
pair (a*b*)*
vowels [a-z]*
%{
#include <stdio.h>
int numbers=0,pairs=0,vowels=0;
%}
%%
^{digits}$ {int i, count = 0;
int occurrence[10];
memset(occurrence,0,sizeof(occurrence));
for(i= 0; i < yyleng-1; i++){
int temp = yytext[i]-'0';
occurrence[temp]++;
}
for( i = 0; i < 10; i++ ){
if( occurrence[i] > 1 )
	++count;
}
if( count <= 1 )
printf("%s is a string with atmost 1 repeated digit\n",yytext);
}
^{pair}$ {int a = 0, b = 0, i;
for( i = 0; i < yyleng; i++){
if( yytext[i] == 'a' )
	++a;
else 
	++b;
}
if(a%2 == 0 && b%2 != 0 )
printf("%s is a string with even a's and odd b's\n",yytext);
}
^{vowels}a{vowels}e{vowels}i{vowels}o{vowels}u{vowels}$ {printf("%s contains all 5 vowels in order\n",yytext);}
%%
int main(void){
yylex();
return 0;
} 
