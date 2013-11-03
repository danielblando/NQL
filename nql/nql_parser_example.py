from nql_parser import parser

# Test it out
data = ''' selecionar idade de pessoas com idade igual 1'''

# Give the parser some input
parser.parse(data)
