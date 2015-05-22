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

%token  TK_ID TK_GREATHERTHAN TK_LESSTHAN TK_LESSOREQUAL TK_GREATHEROREQUAL TK_EQUALEQUAL TK_NOTEQUAL TK_IN TK_OR TK_AND TK_SELECT TK_INSERT TK_UPDATE TK_DELETE TK_FROM TK_WHERE TK_GROUPBY TK_HAVING TK_ORDERBY TK_JOIN
%token	TK_COUNT TK_AVG TK_MIN TK_MAX TK_SUM TK_FIRST TK_LAST TK_LEN

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
	   		| /*vazio*/  ;
	
dml :  	select
		| insert
		| update
		| delete ;
		
select :	TK_SELECT columnsFuncListRec TK_FROM TK_ID clauses;	
			| TK_SELECT columnsListRec TK_FROM TK_ID;

insert : 	TK_INSERT ;

update :	TK_UPDATE ;

delete :	TK_DELETE ;

clauses :	cla_where 
			| cla_groupby 
			| cla_having
			| cla_orderby
			| cla_join ;

cla_where :	TK_WHERE conditionListRec ;

cla_groupby :	TK_GROUPBY columnsListRec ;

cla_having :	TK_HAVING conditionListRec ;

cla_orderby :	TK_ORDERBY columnsListRec ;

cla_join :	TK_JOIN TK_ID clauses ;

conditionList : exp condition exp ;

conditionListRec : 	conditionList
					| conditionListRec TK_AND conditionList;
					
columnsFuncListRec :	columnsListRec
						| function  TK_ID
						| columnsFuncListRec TK_AND columnsFuncListRec ;

columnsListRec : 	TK_ID
					| function '(' 
					| columnsListRec TK_AND TK_ID ;
					
condition :		TK_EQUALEQUAL
				| TK_LESSTHAN
				| TK_GREATHERTHAN 
				| TK_NOTEQUAL 
				| TK_LESSOREQUAL
				| TK_GREATHEROREQUAL
				| TK_IN conditionListRec ;

exp :	TK_ID
		| TK_INTERGER
		| TK_FLOATNUMBER ;
		
function :	TK_COUNT 
			| TK_AVG
			| TK_MIN
			| TK_MAX
			| TK_SUM
			| TK_FIRST
			| TK_LAST
			| TK_LEN ;
		

%%
int yyerror (char const *s)
 {
    fprintf( stderr, "%s\n%d %s de sintaxe %s.\n", s, yynerrs, (yynerrs == 1)?"erro":"erros", (yynerrs == 1)?"encontrado":"encontrados"  );
    return 0;   
 }
