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
	raise Exception('Voce provavelmente esqueceu ou inseriu o comando select errado. Nao conseguimos reconhecer - ' + p)

def erro_colmunFuncListRec(p):
	raise Exception('Voce provavelmente esqueceu ou inseriu sua lista de colunas errada. Nao conseguimos reconhecer - ' + p)

def erro_claWhere(p):
	raise Exception('You possibly forget or insert the from statment wrong. We could not recognize - ' + p)