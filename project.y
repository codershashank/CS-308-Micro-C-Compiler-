%{

void yyerror(char *s);
#include<stdio.h>
#include<stdlib.h>

%}

%start program

%token LE
%token GE
%token EQ
%token NE
%token OR
%token AND
%token IF
%token ELSE
%token WHILE
%token RETURN
%token BREAK
%token NEW
%token SIZE
%token VOID
%token BOOL
%token INT
%token FLOAT
%token INT_LIT
%token FLOAT_LIT
%token BOOL_LIT
%token IDENT



%%

program		:	decl_list	;
decl_list	: 	decl_list decl | decl	;
decl		: 	var_decl | fun_decl	;
var_decl 	: 	type_spec IDENT ';' | type_spec IDENT '[' ']' ';'	;
type_spec 	:	VOID | BOOL | INT | FLOAT		;
fun_decl 	: 	type_spec IDENT '(' params ')' compound_stmt ;

params		:	param_list | VOID		;
param_list	:	param_list ','	param | param		;
param		:	type_spec IDENT | type_spec IDENT '[' ']' 	;
compound_stmt	:	'{' local_decls stmt_list '}'  ;
local_decls	:	local_decls local_decl	| ;
local_decl	:	type_spec IDENT ';'	| type_spec IDENT '[' ']'  ';'		;	
stmt_list	:	stmt_list stmt | ;
stmt		:	expr_stmt | compound_stmt | if_stmt | while_stmt | return_stmt | break_stmt ;

expr_stmt	:	expr ';' | ';'	;
while_stmt	:	WHILE '(' expr ')' stmt	;
if_stmt		:	IF '(' expr ')' stmt  | IF '(' expr ')' stmt ELSE stmt ;
return_stmt	:	RETURN ';'	| RETURN expr ';' ;
break_stmt	:	BREAK ';' ;
expr		:	IDENT '=' expr	;
expr		:	IDENT '[' expr ']' '=' expr ;
expr		:	expr OR	expr;
expr		:	expr AND expr;
expr		:	expr EQ expr	| expr NE expr ;
expr		:	expr LE expr | expr '<' expr | expr GE expr | expr '>'	expr ;
expr		:	expr '+' expr | expr '-' expr ;
expr		:	expr '*' expr | expr  '/' expr | expr '%' expr;	
expr		:	'!' expr | '-' expr | '+' expr ;
expr		:	'(' expr ')' ;
expr 		:       IDENT | IDENT '[' expr ']' | IDENT '(' args ')' | IDENT '.' SIZE ;
expr		:	BOOL_LIT | INT_LIT | FLOAT_LIT | NEW type_spec '[' expr ']' ;
arg_list 	:	arg_list ',' expr | expr ;
args		:	arg_list | ;


%%

int main(void){
	return yyparse();
}
void yyerror(char *s){
	fprintf(stderr,"%s\n",s);
}	
