
/*printfs para checar */
#define FunPrintf(a) printf(a)
#define AsmPrintf(a) printf(a)


/*Checa se malloc funcionou */
#define CHECAMEM(a) if(a==NULL) exit(1)

typedef enum dmlTOKEN{SELECT, INSERT, UPDATE, DELETE}DmlTOKEN;
typedef enum clauTOKEN{WHERE, ORDERBY, HAVING, GROUPBY, JOIN}ClauTOKEN;
typedef enum condTOKEN{EQUALEQUAL, LESSTHAN, GREATHERTHAN, NOTEQUAL, LESSOREQUAL, GREATHEROREQUAL}CondTOKEN;
typedef enum funcTOKEN{COUNT, AVG, MIN, MAX, SUM, FIRST, LAST, LEN}FuncTOKEN;
typedef enum columnFuncTOKEN{COLUMN, FUNCTION}ColumnFuncTOKEN;
typedef enum expTOKEN{INT, FLOAT, CHAR}ExpTOKEN;



/*Tipo de nos da arvore */
typedef struct programa 			ProgNo;

typedef struct dml					DmlNo;
typedef struct dmlSelect 			SelectNo;

typedef struct clausesRec			ClausesRecNo;
typedef struct clauses				ClausesNo;
typedef struct claWhere				WhereNo;
typedef struct claGroupby			GroupbyNo;
typedef struct claHaving			HavingNo;
typedef struct claOrderby			OrderbyNo;
typedef struct claJoin				JoinNo;

typedef struct conditionListRec		CondListRecNo;
typedef struct conditionList		CondListNo;

typedef struct columnsFuncListRec	ColumnFuncListRecNo;
typedef struct columnsFuncList		ColumnFuncListNo;
typedef struct function				FuncNo;

typedef struct expression			ExpNo;


/************* Declaracao  de struct de nos da arvore *********/
struct programa
{
	DmlNo* dml;
};

struct dml
{
	DmlTOKEN token;
	SelectNo* select;
};

struct dmlSelect
{
	ColumnFuncListRecNo* columnFuncListRec;
	char* table;
	ClausesRecNo* clausesRec;
};

struct clausesRec
{
	ClausesNo* clauses;
	ClausesRecNo* clausesRec;
};

struct clauses
{
	ClauTOKEN token;
	WhereNo* where;
	GroupbyNo* groupBy;
	HavingNo* having;
	OrderbyNo* orderBy;
	JoinNo* join;
};

struct claWhere
{
	CondListRecNo* condListRec;
};

struct claGroupby
{
	ColumnFuncListRecNo* columnFuncListRec;
};

struct claHaving
{
	CondListRecNo* condListRec;
};

struct claOrderby
{
	ColumnFuncListRecNo* columnFuncListRec;
};

struct claJoin
{
	char* table;
};

struct conditionListRec
{
	CondListNo* condList;
	CondListRecNo* condListRec;
};

struct conditionList
{
	CondTOKEN token;
	ExpNo* firstExp;
	ExpNo* secondExp;
};

struct columnsFuncListRec
{
	ColumnFuncListNo* columnFuncList;
	ColumnFuncListRecNo* columnFuncListRec;
};

struct columnsFuncList
{
	ColumnFuncTOKEN token;
	union
	{
		struct
		{
			char* id;
		}column;
		
		struct
		{
			FuncTOKEN token;
			char* id;
		}function;	
	}columnFuncUnion;
};

struct function
{
	FuncTOKEN token;
};

struct expression
{
	ExpTOKEN token;
	int i;
	float f;
	char* s;
};

/********** Funcao de Criacao dos Nos da Arvore **********************/
/* Funcao para programa regras */
ProgNo* FunProg(DmlNo* a1);

/* Funcao para DML regras */
DmlNo* FunDmlSelect(SelectNo* a1);
SelectNo* FunSelect(ColumnFuncListRecNo* a1, char* a2, ClausesRecNo* a3);

/* Funcao para Clauses regras */
ClausesRecNo* FunClausesRec(ClausesRecNo* a1, ClausesNo* a2);

/* Funcao para Conditions regras */
CondListRecNo* FunCondListRec(CondListRecNo* a1, CondListNo* a2);
CondListNo* FunCondList(ExpNo* a1, CondTOKEN token, ExpNo* a2);

/* Funcao para Columns and Functions regras */
ColumnFuncListRecNo* FunColumnFuncListRec(ColumnFuncListRecNo* a1, ColumnFuncListNo* a2);
ColumnFuncListNo* FunColumnFuncList(ColumnFuncTOKEN token,FuncNo* tokenFunc, char* id);
FuncNo* FunFunc(FuncTOKEN token);

/* Funcao para Expression regras */
ExpNo* FunExpInt(int id);
ExpNo* FunExpFloat(float id);
ExpNo* FunExpChar(char* id);

