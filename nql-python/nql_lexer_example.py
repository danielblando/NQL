from nql_lexer import lexer

# Test it out
data = ''' selecionar idade dos alunos '''

# Give the lexer some input
lexer.input(data)

# Tokenize
while True:
    tok = lexer.token()
    if not tok: break      # No more input
    print tok

