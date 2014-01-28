# ------------------------------------------------------------
# nql_tag.py
#
# ------------------------------------------------------------
import nltk

def tagSentence(sentence):
	text = nltk.word_tokenize(sentence)
	text_tagged = text.tagged_words()
	return text_tagged
