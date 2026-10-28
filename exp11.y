%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror(char *);
%}

%token DT ID

%%
E: DT S ';'
S: S ',' ID | ID;
%%

int main() {
printf("Enter Variable declaration:\n");
if (yyparse() == 0)
	printf("Valid declaration\n");
return 0;
}
int yyerror(char* s) {
printf("Invalid declaration\n");
return 0;
}
