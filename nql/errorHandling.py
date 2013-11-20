def parse_error(p, stack):
	print repr(p)
	print p.value
	print 'select' in stack
	print stack

	if 'select' in stack:
		erro_select(p.value)
	elif 'columnsFuncListRec' in stack:
		erro_colmunFuncListRec(p.value)

	quit()
#	raise Exception("Syntax error in input! - " + repr(p))

def erro_select(p):
	raise Exception('You possibly forget to put the select statment. We could not recognize - ' + p)

def erro_colmunFuncListRec(p):
	raise Exception('You possibly get your list of columns and/or function wrong. We could not recognize - ' + p)

