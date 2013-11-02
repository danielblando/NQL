#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "createSql.h"

char* sqlResult;


////////////////////////////////////////////////////////////////////////////////////
/*   Funcoes para manipular a arvore e escrever o assembly */
void SqlProg(ProgNo* a1)
{
	AsmPrintf("Funcao SqlProg Inicio\n");
	sqlResult = (char*) malloc(sizeof(500));

	SqlDml(a1->dml);

	AsmPrintf("Funcao SqlProg Fim\n");
	printf("Resultado:\n%s\n", sqlResult);
}

void SqlDml(DmlNo* a1)
{
	AsmPrintf("Funcao SqlDml Inicio\n");
	switch(a1->token)
	{
		case SELECT:
			SqlSelect(a1->select);
			break;
	};
	AsmPrintf("Funcao SqlDml Fim\n");
}

void SqlSelect(SelectNo* a1)
{
	AsmPrintf("Funcao SqlSelect Inicio\n");

	AddTextToResult("SELECT");
	SqlColumnFuncListRec(a1->columnFuncListRec);
	AddTextToResult("FROM");
	AddTextToResult(a1->table);
	if(a1->clausesRec != NULL)
	{
		//SqlClausesRec(a1->clausesRec);
	}

	AsmPrintf("Funcao SqlSelect Fim\n");
}

void SqlColumnFuncListRec(ColumnFuncListRecNo* a1)
{
	AsmPrintf("Funcao SqlColumnFuncListRec Inicio\n");
	if(a1->columnFuncListRec != NULL)
	{
		SqlColumnFuncListRec(a1->columnFuncListRec);
		AddTextToResult(",");
	}
	SqlColumnFuncList(a1->columnFuncList);

	AsmPrintf("Funcao SqlColumnFuncListRec Fim\n");
}

void SqlColumnFuncList(ColumnFuncListNo* a1)
{
	AsmPrintf("Funcao SqlColumnFuncList Inicio\n");

	switch(a1->token)
	{
		case COLUMN:
			AddTextToResult(a1->columnFuncUnion.column.id);
			break;

		case FUNCTION:
			AddTextOfFunc(a1->columnFuncUnion.function.token);
			AddTextToResult("(");
			AddTextToResult(a1->columnFuncUnion.function.id);
			AddTextToResult(")");
			break;
	}

	AsmPrintf("Funcao SqlColumnFuncList Fim\n");
}


////////////////////////////////////////////////////////////////////////////////////
/*   Funcoes auxiliares */
void AddTextToResult(char* a1)
{
	char *result = malloc(500);
	strcat(result,sqlResult);
	strcat(result,a1);
	strcat(result," ");
	sqlResult = result;
}

void AddTextOfFunc(FuncTOKEN token)
{
	switch(token)
	{
		case COUNT:
			AddTextToResult("COUNT");
			break;
		case AVG:
			AddTextToResult("AVG");
			break;
		case MIN:
			AddTextToResult("MIN");
			break;
		case MAX:
			AddTextToResult("MAX");
			break;
		case SUM:
			AddTextToResult("SUM");
			break;
		case FIRST:
			AddTextToResult("FIRST");
			break;
		case LAST:
			AddTextToResult("LAST");
			break;
		case LEN:
			AddTextToResult("LEN");
			break;
	}
}
