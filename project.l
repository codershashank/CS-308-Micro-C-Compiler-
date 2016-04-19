%{
#include "y.tab.h"
%}

%%
[(){};,+*/%<>=!] 	{return yytext[0];}
"["			{return yytext[0];}
"]"			{return yytext[0];}
"-"			{return yytext[0];}
"<="			{return LE;}
">="			{return GE;}
"=="			{return EQ;}
"!="			{return NE;}
"||"			{return OR;}
"&&"			{return AND;}
"if"			{return IF;}
"else"			{return ELSE;}
"while"			{return WHILE;}
"return"		{return RETURN;}
"break"			{return BREAK;}
"new"			{return NEW;}
"size"			{return SIZE;}
"void"			{return VOID;}
"bool"			{return BOOL;}
"int"			{return INT;}
"float"			{return FLOAT;}
"true"			{return BOOL_LIT;}
"false"			{return BOOL_LIT;}
[0-9]+			{return INT_LIT;}
[0-9]+.[0-9]+		{return FLOAT_LIT;}
[a-zA-Z_][a-zA-Z_0-9]*	{return IDENT;}
[ \t\n]			;
.			{yyerror("Wrong");}


%%

int yywrap(void){
	return 1;
}
