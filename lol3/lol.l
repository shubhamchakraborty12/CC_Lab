%{

#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>

%}

%%
[a-zA-Z][a-zA-Z0-9]*		{yylval.symbol = strdup(yytext); return ID;}
[ \t]				{}
\n				{return 0;}
.				{return yytext[0];}
%%

int yywrap() {
	return 1;
}
