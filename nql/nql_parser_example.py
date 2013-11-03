from nql_parser import parser

# Test it out
data = ''' selecionar idade de pessoas com idade igual 1'''
data2 = ''' selecionar idade de pessoas '''

# Give the parser some input
print parser.parse(data)
print parser.parse(data2)
