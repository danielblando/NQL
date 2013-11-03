# ------------------------------------------------------------
# createSql.py
#
# ------------------------------------------------------------
from objects import *

#Debug
def SqlPrint(s):
	if 0:
		print s

class Result:
    def __init__(self, query):
    	self.query = query

result = Result("")

def AddTextToResult(s):
	result.query = result.query + s + ' '

def AddTextOfFunc(condToken):
	if condToken is CondToken.EQUALEQUAL:
		AddTextToResult("==")
	elif condToken is CondToken.LESSTHAN:
		AddTextToResult("<")
	elif condToken is CondToken.GREATHERTHAN:
		AddTextToResult(">")
	elif condToken is CondToken.NOTEQUAL:
		AddTextToResult("!=")
	elif condToken is CondToken.LESSOREQUAL:
		AddTextToResult("<=")
	elif condToken is CondToken.GREATHEROREQUAL:
		AddTextToResult(">=")
	

######################################################################
#   Funcoes para manipular a arvore e escrever o sql #
##################Programa##################
def SqlProg(progNo):
	SqlPrint("Funcao SqlProg inicio")
	result.query = ''
	SqlDml(progNo.dml)
	SqlPrint("Funcao SqlProg fim")
	return result.query

##################Dml########################
def SqlDml(dmlNo):
	SqlPrint("Funcao SqlDml inicio")
	if dmlNo.dmlToken == DmlToken.SELECT:
			SqlSelect(dmlNo.obj)
	SqlPrint("Funcao SqlDml fim")


def SqlSelect(selectNo):
	SqlPrint("Funcao SqlSelect inicio")
	AddTextToResult("SELECT")
	SqlColumnFuncListRec(selectNo.columnFuncListRec)
	AddTextToResult("FROM")
	AddTextToResult(selectNo.table)

	if selectNo.clausesRec is not None:
		SqlClausesRec(selectNo.clausesRec)

	SqlPrint("Funcao SqlSelect fim")

##################ColumnFunc##################
def SqlColumnFuncListRec(columnFuncListRecNo):
	SqlPrint("Funcao SqlColumnFuncListRec inicio")
	if columnFuncListRecNo.columnFuncListRec is not None:
		SqlColumnFuncListRec(columnFuncListRecNo.columnFuncListRec)
		AddTextToResult(",")

	SqlColumnFuncList(columnFuncListRecNo.columnFuncList)
	SqlPrint("Funcao SqlColumnFuncListRec fim")

def SqlColumnFuncList(columnFuncListNo):
	SqlPrint("Funcao SqlColumnFuncList inicio")
	if columnFuncListNo.funcToken is not None:
		AddTextOfFunc(columnFuncListNo.function.token)
		AddTextToResult("(")
		AddTextToResult(columnFuncListNo.value)
		AddTextToResult(")")
	else:
		AddTextToResult(columnFuncListNo.value)
	SqlPrint("Funcao SqlColumnFuncList fim")

########################Clauses##################
def SqlClausesRec(clausesRecNo):
	SqlPrint("Funcao SqlClausesRec inicio")
	if clausesRecNo.clausesRec is not None:
		SqlClausesRec(clausesRecNo.clausesRec)
	SqlClauses(clausesRecNo.clauses)
	SqlPrint("Funcao SqlClausesRec fim")

def SqlClauses(clausesNo):
	SqlPrint("Funcao SqlClauses inicio")
	if clausesNo.claToken is ClaToken.WHERE:
		SqlWhere(clausesNo.obj)
	elif clausesNo.claToken is ClaToken.ORDERBY:
		SqlOrderby(clausesNo.obj)
	elif clausesNo.claToken is ClaToken.HAVING:
		SqlHaving(clausesNo.obj)
	elif clausesNo.claToken is ClaToken.GROUPBY:
		SqlGroupby(clausesNo.obj)
	elif clausesNo.claToken is ClaToken.JOIN:
		SqlJoin(clausesNo.obj)
	SqlPrint("Funcao SqlClauses fim")

def SqlWhere(whereNo):
	SqlPrint("Funcao SqlWhere inicio")
	AddTextToResult("WHERE")
	SqlCondListRec(whereNo.condListRec)
	SqlPrint("Funcao SqlWhere fim")

def SqlOrderby(orderbyNo):
	SqlPrint("Funcao SqlOrderby inicio")
	AddTextToResult("ORDER BY")
	AddTextToResult("(")
	SqlColumnFuncListRec(orderbyNo.columnFuncListRec)
	AddTextToResult(")")
	SqlPrint("Funcao SqlOrderby fim")

def SqlHaving(havingNo):
	SqlPrint("Funcao SqlHaving inicio")
	AddTextToResult("HAVING")
	SqlCondListRec(havingNo.condListRec)
	SqlPrint("Funcao SqlHaving fim")

def SqlGroupby(groupbyNo):
	SqlPrint("Funcao SqlGroupby inicio")
	AddTextToResult("GROUP BY")
	AddTextToResult("(")
	SqlColumnFuncListRec(groupbyNo.columnFuncListRec)
	AddTextToResult(")")
	SqlPrint("Funcao SqlGroupby fim")

def SqlJoin(joinNo):
	SqlPrint("Funcao SqlJoin inicio")
	AddTextToResult("JOIN")
	AddTextToResult(joinNo.table)
	SqlPrint("Funcao SqlJoin fim")

########################Condition########################
def SqlCondListRec(condListRecNo):
	SqlPrint("Funcao SqlCondListRec inicio")
	if condListRecNo.condListRec is not None:
		SqlCondListRec(condListRecNo.condListRec)
	SqlCondList(condListRecNo.condList)
	SqlPrint("Funcao SqlCondListRec fim")

def SqlCondList(condListNo):
	SqlPrint("Funcao SqlCondList inicio")
	SqlExp(condListNo.firstExp)
	AddTextOfFunc(condListNo.condToken)
	SqlExp(condListNo.secondExp)
	SqlPrint("Funcao SqlCondList fim")

########################Expression########################
def SqlExp(expNo):
	if expNo.expToken is ExpToken.CHAR:
		AddTextToResult(expNo.value)
	elif expNo.expToken is ExpToken.INT:
		AddTextToResult(str(expNo.value))




