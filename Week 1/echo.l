%%
. ECHO;
\n ECHO;
%%
int yywrap(){
return 1;
}
int main(void){
yylex();
return 0;
}
