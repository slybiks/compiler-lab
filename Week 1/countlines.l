%{
int charcount = 0, linecount = 0;
%}
%%
. charcount++;
\n {linecount++; charcount++; printf("The number of characters are %d and lines are %d\n",charcount,linecount);}
%%
int main()
{
yylex();
return 0;
}
