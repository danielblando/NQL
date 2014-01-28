# ------------------------------------------------------------
# nltk.py
#
# ------------------------------------------------------------
import nltk

from nql_parser import parser

from wordRoot import stems

from nltk.metrics.distance import (jaccard_distance, fractional_presence)


def teste():
  return checkStemmer("selecasea")

def checkStemmer(word):
  for originalWord, root in stems.iteritems():
    if stem(word).find(root) != -1:
      return originalWord
  return word


def stem(word):
  stemmer = nltk.stem.RSLPStemmer()
  return stemmer.stem(word)


def queryTreat(query):
  result_query = ""
  query_tokenized = nltk.word_tokenize(query)
  print query_tokenized
  for word in query_tokenized:
    result_query = result_query + checkStemmer(word) + " "
  print result_query
  return parser.parse(result_query)





