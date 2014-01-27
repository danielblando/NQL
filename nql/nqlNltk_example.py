from nqlNltk import queryTreat
from nqlNltk import stem
from nqlNltk import checkSelect

# Test it out
data = '''selecionando idade de aluno'''

# Give the parser some input
print queryTreat(data)
