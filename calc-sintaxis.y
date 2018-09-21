%{

#include <stdlib.h>
#include <stdio.h>

%}

%union { int i; char *s; }

%token<i> INT
%token<s> ID
%token VAR

%type<i> expr

%left '+'
%left '*'

%%

prog: dec expr ';'      { printf("%s%d\n", "Resultado: ",$2); evaluarExpr() }
    ;
dec:
    | VAR ID '=' INT ';' dec
    ;

expr: INT               { $$ = create(itoa($1), null, null);
                           printf("%s%d\n","Constante entera:",$1);
                        }
    | ID                { $$ = $1;
                               printf("%s%s\n","Identificador:",$1);
                        }

    | expr '+' expr     { $$ = create($1, '+' , $3);
                          // printf("%s,%d,%d,%d\n","Operador Suma\n",$1,$3,$1+$3);
                        }
    | expr '*' expr     { $$ = $1 * $3;
                          // printf("%s,%d,%d,%d\n","Operador Producto\n",$1,$3,$1*$3);
                        }
    | '(' expr ')'              { $$ =  $2; }
    ;

%%
