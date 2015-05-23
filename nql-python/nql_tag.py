# ------------------------------------------------------------
# nql_tag.py
#
# ------------------------------------------------------------
import nltk

unwantedWords = {'a', 'o', 'as', 'os', 'por', 'que'}

def tagSentence(sentence):
	result = ""
	tokenSentence = nltk.word_tokenize(sentence)
	for token in tokenSentence:
		if(token not in unwantedWords):
			result = result + token + " "

	return result
