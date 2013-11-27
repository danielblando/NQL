from nql_parser import parser

# Test it out
data = ''' selecionar adf de alunos asdf '''

# Give the parser some input
print parser.parse(data)
