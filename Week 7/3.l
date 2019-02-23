dig [0-9]
do "do{"
while "}while("
init1 [a-zA-Z;]*
op [=|>|<]
cl ")"
cls "}"
%{

char *s1="";
char *s2="";
%}
%%
{do}{do} {printf("do{");}
{init1}{cls} {
printf("\n%s\n",yytext);
}
{while} {
printf("&&(");
}
{init1}{op}{dig}{cl} {
if(strcmp(s1,"")==0)
s1=yytext;
else
s2=yytext;
}
%%
int main()
{
yylex();
}



