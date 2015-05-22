#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tree.h"

/********** Funcao de Criacao dos Nos da Arvore **********************/
/* Funcao para programa regras */
ProgNo* FunProg(DmlNo* a1)
{
	ProgNo* novo;
	novo = (ProgNo*) malloc(sizeof(ProgNo));
	CHECAMEM(novo);
	novo->dml = a1;
	FunPrintf("Funcao de No Prog\n");
	SqlProg(novo);
	return novo;
}

DmlNo* FunDmlSelect(SelectNo* a1)
{
	DmlNo* novo;
	novo = (DmlNo*) malloc(sizeof(DmlNo));
	CHECAMEM(novo);
	novo->token = SELECT;
	novo->select = a1;
	FunPrintf("Funcao de Dml Select\n");
	return novo;
}

SelectNo* FunSelect(ColumnFuncListRecNo* a1, char* a2, ClausesRecNo* a3)
{
	SelectNo* novo;
	novo = (SelectNo*) malloc(sizeof(SelectNo));
	CHECAMEM(novo);
	novo->table = (char*) malloc(strlen(a2)+1);
	CHECAMEM(novo->table);
	novo->columnFuncListRec = a1;
	strcpy(novo->table,a2);
	novo->clausesRec = a3;
	FunPrintf("Funcao de Select\n");
	return novo;
}

ClausesRecNo* FunClausesRec(ClausesRecNo* a1, ClausesNo* a2)
{
	ClausesRecNo* novo;
	novo = (ClausesRecNo*) malloc(sizeof(ClausesRecNo));
	CHECAMEM(novo);
	novo->clausesRec = a1;
	novo->clauses = a2;
	FunPrintf("Funcao de ClausesRec\n");
	return novo;
}

ClausesNo* FunClausesWhere(WhereNo* a1)
{
	ClausesNo* novo;
	novo = (ClausesNo*) malloc(sizeof(ClausesNo));
	CHECAMEM(novo);
	novo->token = WHERE;
	novo->where = a1;
	FunPrintf("Funcao de ClauseWhere\n");
	return novo;
}

CondListRecNo* FunCondListRec(CondListRecNo* a1, CondListNo* a2)
{
	CondListRecNo* novo;
	novo = (CondListRecNo*) malloc(sizeof(CondListRecNo));
	CHECAMEM(novo);
	novo->condListRec = a1;
	novo->condList = a2;
	FunPrintf("Funcao de CondListRec\n");
	return novo;
}

CondListNo* FunCondList(ExpNo* a1, CondTOKEN token, ExpNo* a2)
{
	CondListNo* novo;
	novo = (CondListNo*) malloc(sizeof(CondListNo));
	CHECAMEM(novo);
	novo->token = token;
	novo->firstExp = a1;
	novo->secondExp = a2;
	FunPrintf("Funcao de CondList\n");
	return novo;
}

ColumnFuncListRecNo* FunColumnFuncListRec(ColumnFuncListRecNo* a1, ColumnFuncListNo* a2)
{
	ColumnFuncListRecNo* novo;
	novo = (ColumnFuncListRecNo*) malloc(sizeof(ColumnFuncListRecNo));
	CHECAMEM(novo);
	novo->columnFuncListRec = a1;
	novo->columnFuncList = a2;
	FunPrintf("Funcao de ColumnFuncListRec\n");
	return novo;
}

ColumnFuncListNo* FunColumnFuncList(ColumnFuncTOKEN token,FuncNo* func, char* id)
{
	ColumnFuncListNo* novo;
	novo = (ColumnFuncListNo*) malloc(sizeof(ColumnFuncListNo));
	CHECAMEM(novo);
	novo->token = token;
	switch(token)
	{
		case COLUMN:
			novo->columnFuncUnion.column.id = (char*) malloc(strlen(id)+1);
			CHECAMEM(novo->columnFuncUnion.column.id);
			strcpy(novo->columnFuncUnion.column.id, id);
			break;
		default:
			novo->columnFuncUnion.function.token = func->token;
			novo->columnFuncUnion.function.id = (char*) malloc(strlen(id)+1);
			CHECAMEM(novo->columnFuncUnion.function.id);
			strcpy(novo->columnFuncUnion.function.id, id);
			break;
	}
	FunPrintf("Funcao de ColumnFuncList\n");
	return novo;
}

FuncNo* FunFunc(FuncTOKEN token)
{
	FuncNo* novo;
	novo = (FuncNo*) malloc(sizeof(FuncNo));
	CHECAMEM(novo);
	novo->token = token;
	FunPrintf("Funcao de Func\n");
	return novo;
}


ExpNo* FunExpInt(int id)
{
	ExpNo* novo;
	novo = (ExpNo*) malloc(sizeof(ExpNo));
	novo->token = INT;
	novo->i = id;
	FunPrintf("Funcao de ExpInt\n");
	return novo;
}

ExpNo* FunExpFloat(float id)
{
	ExpNo* novo;
	novo = (ExpNo*) malloc(sizeof(ExpNo));
	novo->token = FLOAT;
	novo->f = id;
	FunPrintf("Funcao de ExpFloat\n");
	return novo;
}

ExpNo* FunExpChar(char* id)
{
	ExpNo* novo;
	novo = (ExpNo*) malloc(sizeof(ExpNo));
	novo->token = CHAR;
	novo->s = (char*) malloc(strlen(id)+1);
	CHECAMEM(novo->s);
	strcpy(novo->s, id);
	FunPrintf("Funcao de ExpChar\n");
	return novo;
}










