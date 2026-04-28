/* prova1.y */

%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token EOL
%token NUM
%token STRING
%token ID
%token PLUS
%token MINUS
%token TIMES
%token DIV
%token ABRE
%token FECHA
%token ASSIGN
%token COMMA
%token PRINT
%token CONCAT
%token LENGTH
%token ILLEGAL

%left PLUS MINUS
%left TIMES DIV
%right ASSIGN

%%

program
    : stmt_list
    ;

stmt_list
    : stmt_list stmt
    | /* empty */
    ;

stmt
    : expr EOL
    | EOL
    ;

expr
    : expr PLUS expr
    | expr MINUS expr
    | expr TIMES expr
    | expr DIV expr
    | ABRE expr FECHA

    | ID ASSIGN expr
    | PRINT ABRE arg_list FECHA

    | CONCAT ABRE arg_list FECHA
    | LENGTH ABRE expr FECHA

    | NUM
    | STRING
    | ID
    ;

arg_list
    : expr
    | arg_list COMMA expr
    ;

%%


