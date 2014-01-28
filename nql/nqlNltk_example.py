from nqlNltk import queryTreat
from nqlNltk import stem
from nqlNltk import checkStemmer

# Test it out
data = '''apresente soma idade dos aluno ordenando idade'''

# Give the parser some input
print queryTreat(data)
