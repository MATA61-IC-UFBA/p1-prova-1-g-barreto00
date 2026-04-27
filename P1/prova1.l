/* recognize tokens for the calculator */

%option noyywrap
%{
#include "prova1.tab.h"
%}

DIGIT              [0-9]
INTEGER_CONST      {DIGIT}+
REAL_CONST         {INTEGER_CONST}"."{INTEGER_CONST}
ID                 [a-zA-Z_][a-zA-Z0-9_]*

%%

[ \t]+              ;

\/\/[^\n]*          ;

{REAL_CONST}        {return NUM;}
{INTEGER_CONST}     {return NUM;}

\"[^\"\n]*\"        {return STRING;}

"print"             {return PRINT;}
"concat"            {return CONCAT;}
"length"            {return LENGTH;}
{ID}                {return ID;}

"="                 {return ASSIGN;}
","                 {return COMMA;}
"+"                 {return PLUS;}
"-"                 {return MINUS;}
"*"                 {return TIMES;}
"/"                 {return DIV;}
"("                 {return ABRE;}
")"                 {return FECHA;}

\n                  {return EOL;}
.                   {return ILLEGAL;}

%%
