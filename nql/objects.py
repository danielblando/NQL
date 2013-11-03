
#Enuns
class DmlToken:
	SELECT=1
	INSERT=2
	UPDATE=3
	DELETE=4

class ClaToken:
	WHERE=1
	ORDERBY=2
	HAVING=3
	GROUPBY=4
	JOIN=5

class CondToken:
	EQUALEQUAL=1
	LESSTHAN=2
	GREATHERTHAN=3
	NOTEQUAL=4
	LESSOREQUAL=5
	GREATHEROREQUAL=6

class FuncToken:
	COUNT=1
	AVG=2
	MIN=3
	MAX=4
	SUM=5
	FIRST=6
	LAST=7
	LEN=8

class ExpToken:
	INT=1
	FLOAT=2
	CHAR=3

#structs
class ProgNo:
	def __init__(self, dml):
			self.dml = dml

class DmlNo:
	def __init__(self, dmlToken, obj):
			self.dmlToken = dmlToken
			self.obj = obj

class SelectNo:
	def __init__(self, table, columnFuncListRec, clausesRec = None):
			self.table = table
			self.columnFuncListRec = columnFuncListRec
			self.clausesRec = clausesRec

class ClausesRecNo:
	def __init__(self, clauses, clausesRec = None):
			self.clauses = clauses
			self.clausesRec = clausesRec

class ClausesNo:
	def __init__(self, claToken, query):
			self.claToken = claToken
			self.query = query

class WhereNo:
	def __init__(self, condListRec):
			self.condListRec = condListRec

class OrderbyNo:
	def __init__(self, columnFuncListRec):
			self.columnFuncListRec = columnFuncListRec

class HavingNo:
	def __init__(self, condListRec):
			self.condListRec = condListRec

class GroupbyNo:
	def __init__(self, columnFuncListRec):
			self.columnFuncListRec = columnFuncListRec

class JoinNo:
	def __init__(self, table):
			self.table = table

class CondListRecNo:
	def __init__(self, condList, condListRec = None):
			self.condList = condList
			self.condListRec = condListRec

class CondListNo:
	def __init__(self, condToken, firstExp, secondExp):
			self.condToken = condToken
			self.firstExp = firstExp
			self.secondExp = secondExp

class ColumnFuncListRecNo:
	def __init__(self, columnFuncList, columnFuncListRec = None):
			self.columnFuncList = columnFuncList
			self.columnFuncListRec = columnFuncList

class ColumnFuncListNo:
	def __init__(self, value, funcToken = None):
			self.funcToken = funcToken
			self.value = value

class ExpNo:
	def __init__(self, expToken, value):
		self.expToken = expToken
		self.value = value









