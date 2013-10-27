%{
    #include<stdio.h> 
    int yyerror(char const *s);
    int yylex(void);
%}

%union {
	float floatNumber; 
	int intNumber; 
	char* string;
}

%token  TK_ID TK_GREATERORIQUAL TK_LESSOREQUAL TK_IQUALIQUAL TK_NOTEQUAL TK_OR TK_AND TK_SELECT TK_INSERT TK_UPDATE TK_DELETE TK_FROM TK_WHERE TK_GROUPBY TK_HAVING TK_ORDERBY TK_JOIN

%token<intNumber> TK_INTERGER
%token<floatNumber> TK_FLOATNUMBER
%token<string> TK_STRING

%error-verbose
%right '='
%left '+' '-'
%left '*' '/' '%'
%left UMINUS 
%left '<' '>'
%left TK_GREATERORIQUAL TK_LESSOREQUAL 
%left TK_IQUALIQUAL TK_NOTEQUAL
%left TK_OR TK_AND
%start programa

%%
programa : 	dml 
			| teste
	   		| /*vazio*/  ;
	
teste : "teste" ;

dml :  	select
		| insert
		| update
		| delete ;
		
select :	TK_SELECT ;

insert : 	TK_INSERT ;

update :	TK_UPDATE ;

delete :	TK_DELETE ;
		

%%
int yyerror (char const *s)
 {
   fprintf( stderr, "%s\n%d %s de sintaxe %s.\n", s, yynerrs, (yynerrs == 1)?"erro":"erros", (yynerrs == 1)?"encontrado":"encontrados"  );
    return 0;   
 }
