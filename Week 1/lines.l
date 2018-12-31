%{
int nchar, nword, nline;
%}
%%
\n { nline++; nchar++; printf("Number of characters, words and lines : %d %d %d\n",nchar,nword,nline); }
[^ \t\n]+ { nword++, nchar += yyleng;}
. { nchar++; }
%%
int main(void) {
yylex();
return 0;
}
