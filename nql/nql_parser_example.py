from nql_parser import parser

# Test it out
data = ''' selecionar adf adsf de alunos '''

# Give the parser some input
print parser.parse(data)
