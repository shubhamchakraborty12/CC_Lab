%{
#include<stdio.h>
#include<stdlib.h>
int yyerror(char*s);
int yylex();
%}


%%
S:S S|'('S')'| ;
%%
int yyerror(char*s){
	printf("Invalid Expression!!");
	exit(0);
}
int main(){
	printf("Enter an Expression: ");
	yyparse();
	printf("Valid Expression");
	return 0;
}
