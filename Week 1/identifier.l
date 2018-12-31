%{
int count = 0;
%}
%%
[A-Za-z]([A-Za-z0-9])* { ECHO;printf(" is valid"); count++; }
%%
int main(void)
{
yylex();
printf("Number of identifiers is %d",count);
return 0;
}
