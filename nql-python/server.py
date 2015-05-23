# -*- coding: utf-8 -*-
"""
    NQL - Servidor
    ~~~~~~~~~~~~~~

    Um servidor simples para facilitar a demonstracao do projeto.
"""
import json
from nql_nltk import stemCheck, spellcheck, tagCheck
from flask import Flask, jsonify, render_template, request
app = Flask(__name__)

feeds = json.load(open("feeds.json"))

@app.route('/execute_query')
def execute_query():
    query = request.args.get('query', '')

    queryTagged = tagCheck(query)

    corrections, wrong = spellcheck(queryTagged)

    try:
        if wrong:
            print map(lambda p: {'wrong': p[0], 'right': p[1]}, corrections)
            print '-'
            print jsonify(map(lambda p: {'wrong': p[0], 'right': p[1]}, corrections))
            return jsonify(result='error', corrections=map(lambda p: {'wrong': p[0], 'right': p[1]}, corrections))
        r = stemCheck(queryTagged)
    except Exception, e:
        r = str(e)
        print r

    print 'Query:', query
    print 'Resultado:', r

    return jsonify(result=r)


@app.route('/add_word')
def add_word():
    word = query = request.args.get('wordReceived', '')
    command = query = request.args.get('commandReceived', '')


@app.route('/')
def index():
    return render_template('index.html', feeds=feeds)

if __name__ == '__main__':
    app.run()