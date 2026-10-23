%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
int yyerror(char *);

int tempCount = 0;
char* newTemp() {
    char* temp = (char*)malloc(10);
    sprintf(temp, "t%d", ++tempCount);
    return temp;
}
%}


%union {
    char* symbol;
}


%token <symbol> ID
%type <symbol> expr T F

%%
statement: ID '=' expr  { printf("%s = %s\n", $1, $3); }
         | expr
         ;

expr: expr '+' T    { 
        $$ = newTemp(); 
        printf("%s = %s + %s\n", $$, $1, $3); 
    }
    | expr '-' T    { 
        $$ = newTemp(); 
        printf("%s = %s - %s\n", $$, $1, $3); 
    }
    | T             { $$ = $1; }
    ;

T: T '*' F          { 
        $$ = newTemp(); 
        printf("%s = %s * %s\n", $$, $1, $3); 
    }
 | T '/' F          { 
        $$ = newTemp(); 
        printf("%s = %s / %s\n", $$, $1, $3); 
    }
 | F                { $$ = $1; }
 ;

F: ID               { $$ = $1; }
 ;
%%

int main() {
    printf("Enter Arithmetic Expression:\n");
    yyparse();
    return 0;
}

int yyerror(char* s) {
    printf("Invalid Expression\n");
    return 0;
}

