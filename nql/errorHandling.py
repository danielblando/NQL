def parse_error(p, stack):
	print repr(p)
	print p.value
	print 'select' in stack
	print stack

	if 'select' in stack:
		erro_select(p.value)
	elif 'columnsFuncListRec' in stack:
		erro_colmunFuncListRec(p.value)
	elif 'claWhere' in stack:
		erro_claWhere(p.value)
	quit()

def erro_select(p):
	raise Exception('You possibly forget or insert the select statment wrong. We could not recognize - ' + p)

def erro_colmunFuncListRec(p):
	raise Exception('You possibly get your list of columns and/or functions wrong. We could not recognize - ' + p)

def erro_claWhere(p):
	raise Exception('You possibly forget or insert the from statment wrong. We could not recognize - ' + p)