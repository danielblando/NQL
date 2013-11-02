
#Enuns
class DmlToken:
	SELECT=1
	INSERT=2
	UPDATE=3
	DELETE=4

#structs
class ProgNo:
	def __init__(self, dml):
			self.dml = dml

class DmlNo:
	def __init__(self, dmlToken, dml):
			self.dmlToken = dmlToken
			self.dml = dml

class SelectNo:
	def __init__(self, columnFuncListRec, clausesRec):
			self.columnFuncListRec = columnFuncListRec
			self.clausesRec = clausesRec