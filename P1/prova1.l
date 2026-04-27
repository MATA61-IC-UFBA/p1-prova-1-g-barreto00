/* recognize tokens for the calculator */

%option noyywrap
%{
#include "token.h"
%}

DIGIT              [0-9]
INTEGER_CONST       {DIGIT}+
REAL_CONST          {INTEGER_CONST}"."{INTEGER_CONST}

%%

[ \t]+              ;

{REAL_CONST}       {return NUM;}

{INTEGER_CONST}    {return NUM;}

"+"                 {return PLUS;}
"-"                 {return MINUS;}
"*"                 {return TIMES;}
"/"                 {return DIV;}
"("                 {return ABRE;}
")"                 {return FECHA;}

\n                  {return EOL;}
.                   {return EOL;}

%%