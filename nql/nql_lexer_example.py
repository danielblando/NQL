from nql_lexer import lexer

# Test it out
data = ''' selecionar idade de pessoas '''
data2 = ''' selecionar ab de ab '''

# Give the lexer some input
lexer.input(data)

# Tokenize
while True:
    tok = lexer.token()
    if not tok: break      # No more input
    print tok

