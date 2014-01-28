# ------------------------------------------------------------
# nltk.py
#
# ------------------------------------------------------------
import nltk

from nql_parser import parser
from nltk.metrics.distance import (jaccard_distance, fractional_presence)

from spelling import correct


def teste():
  return checkSelect("selecasea")

def checkSelect(word):
  select = 'selec'
  result = stem(word)
  if result.find(select) != -1:
    return "selecionar"
  else:
    return word



def stem(word):
  stemmer = nltk.stem.RSLPStemmer()
  return stemmer.stem(word)


def queryTreat(query):
  result_query = ""
  query_tokenized = nltk.word_tokenize(query)
  print query_tokenized
  for word in query_tokenized:
   result_query = result_query + checkSelect(word) + " "
  print result_query
  return parser.parse(result_query)


def spellcheck(query):
  words = nltk.word_tokenize(query)
  return [(word, correct(word)) for word in words]
