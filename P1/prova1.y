/* e2.y */

%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s, ...);
int yylex();
%}

%token EOL 
%token NUM      
%token PLUS      
%token MINUS       
%token TIMES      
%token DIV        
%token ABRE
%token FECHA

%left PLUS MINUS
%left TIMES DIV
 


%%
program
: expr EOL
;

expr
    : expr PLUS expr
    | expr MINUS expr
    | expr TIMES expr
    | expr DIV expr
    | ABRE expr FECHA
    | NUM
    ;


%%

