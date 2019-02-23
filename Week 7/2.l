hash "#define "
letters [a-z]*
defop "{ "
sp " "
defcl " }"
op "*"
open "("
close ")"
%%
{hash} {}
{letters} {printf("\n %s(){",yytext);}
{defop}{letters}{sp} {
printf("%s",yytext);
}
{letters}{op}{letters} {printf("%s}",yytext);}
%%
int main()
{
yylex();
}

