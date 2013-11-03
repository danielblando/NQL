from nql_parser import parser

# Test it out
data = ''' selecionar idade de alunos ordernar nome '''

# Give the parser some input
print parser.parse(data)
