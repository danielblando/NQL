from nql_parser import parser

# Test it out
data = ''' selecionar idade de alunos com idade maior 2 '''

# Give the parser some input
print parser.parse(data)
