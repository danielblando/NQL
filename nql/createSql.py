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
def SqlClausesRec(clausesRec):
	SqlPrint("Funcao SqlClausesRec inicio")
	SqlPrint("Funcao SqlClausesRec fim")





