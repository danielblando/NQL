%{
    #include<stdio.h> 
	#include "tree.h"
    int yyerror(char const *s);
    int yylex(void);
%}

%union {
	float floatNumber; 
	int intNumber; 
	char* string;
	
	struct 	programa* 	prog;
	
	struct  dml*		dml;
	struct 	dmlSelect* 	select;
	
	struct  clausesRec*			clausesRec;
	struct  clauses*			clauses;
	struct	claWhere*			where;
	struct	claGroupby*			groupBy;
	struct	claHaving*			having;
	struct	claOrderby*			orderBy;
	struct	claJoin*			join;
	
	struct  conditionListRec* 	condListRec;
	struct  conditionList* 		condList;
	
	struct  columnsFuncListRec* columnFuncListRec;
	struct  columnsFuncList*	columnFuncList;
	struct  function*			function;
	
	struct expression*			exp;
}

%token  TK_GREATHERTHAN TK_LESSTHAN TK_LESSOREQUAL TK_GREATHEROREQUAL TK_EQUALEQUAL TK_NOTEQUAL TK_OR TK_AND TK_SELECT TK_INSERT TK_UPDATE TK_DELETE TK_FROM TK_WHERE TK_GROUPBY TK_HAVING TK_ORDERBY TK_JOIN
%token	TK_COUNT TK_AVG TK_MIN TK_MAX TK_SUM TK_FIRST TK_LAST TK_LEN

%token<intNumber> TK_INTERGER
%token<floatNumber> TK_FLOATNUMBER
%token<string> TK_STRING TK_ID

%type<prog> 				programa
%type<dml>					dml
%type<select> 				select
%type<clausesRec>			clausesRec
%type<clauses>				clauses
%type<where> 				cla_where
%type<groupBy>				cla_groupby
%type<having>				cla_having
%type<orderBy>				cla_orderby
%type<condListRec>			conditionListRec
%type<condList>				conditionList
%type<columnFuncListRec>	columnsFuncListRec
%type<columnFuncList>		columnsFuncList
%type<function>				function
%type<exp>					exp

%error-verbose
%left TK_GREATERORIQUAL TK_LESSOREQUAL 
%left TK_IQUALIQUAL TK_NOTEQUAL
%left TK_OR TK_AND
%start programa

%%
programa : 	dml { $$ = FunProg($1); }
	   		| /*vazio*/  { $$ = NULL; }
			;
	
dml :  	select { $$ = FunDmlSelect($1); }
		| insert { $$ = (DmlNo*) malloc(sizeof(DmlNo)); }
		| update { $$ = (DmlNo*) malloc(sizeof(DmlNo)); }
		| delete { $$ = (DmlNo*) malloc(sizeof(DmlNo)); }
		;
		
select :	TK_SELECT columnsFuncListRec TK_FROM TK_ID clausesRec	{ $$ = FunSelect($2,$4,$5); }
			| TK_SELECT columnsFuncListRec TK_FROM TK_ID { $$ = FunSelect($2,$4,NULL); }
			;

insert : 	TK_INSERT ;

update :	TK_UPDATE ;

delete :	TK_DELETE ;

clausesRec :	clauses { $$ = FunClausesRec(NULL, $1); }
				| clausesRec clauses { $$ = FunClausesRec($1, $2); }
				;

clauses :	cla_where 
			| cla_groupby 
			| cla_having 
			| cla_orderby
			| cla_join
			;

cla_where :	TK_WHERE conditionListRec ;

cla_groupby :	TK_GROUPBY columnsFuncListRec ;

cla_having :	TK_HAVING conditionListRec ;

cla_orderby :	TK_ORDERBY columnsFuncListRec ;

cla_join :	TK_JOIN TK_ID ;

conditionList : exp condition exp ;

conditionListRec : 	conditionList
					| conditionListRec TK_AND conditionList
					;
					
columnsFuncListRec :	columnsFuncList									{ $$ = FunColumnFuncListRec(NULL, $1);}
						| columnsFuncListRec TK_AND columnsFuncList 	{ $$ = FunColumnFuncListRec($1, $3);}
						;

columnsFuncList : 	TK_ID				{ $$ = FunColumnFuncList(COLUMN,NULL,$1);}
					| function  TK_ID 	{ $$ = FunColumnFuncList(FUNCTION,$1,$2);}
					;
					
condition :		TK_EQUALEQUAL 			
				| TK_LESSTHAN			
				| TK_GREATHERTHAN 		
				| TK_NOTEQUAL 			
				| TK_LESSOREQUAL		
				| TK_GREATHEROREQUAL 	
				;

exp :	TK_ID
		| TK_INTERGER
		| TK_FLOATNUMBER 
		;
		
function :	TK_COUNT 	{ $$ = FunFunc(COUNT);}
			| TK_AVG	{ $$ = FunFunc(AVG);}
			| TK_MIN	{ $$ = FunFunc(MIN);}
			| TK_MAX	{ $$ = FunFunc(MAX);}
			| TK_SUM	{ $$ = FunFunc(SUM);}
			| TK_FIRST	{ $$ = FunFunc(FIRST);}
			| TK_LAST	{ $$ = FunFunc(LAST);}
			| TK_LEN 	{ $$ = FunFunc(LEN);}
			;
		

%%
int yyerror (char const *s)
 {
    fprintf( stderr, "%s\n%d %s de sintaxe %s.\n", s, yynerrs, (yynerrs == 1)?"erro":"erros", (yynerrs == 1)?"encontrado":"encontrados"  );
    return 0;   
 }
