# -*- coding: utf-8 -*-
"""
    NQL - Servidor
    ~~~~~~~~~~~~~~

    Um servidor simples para facilitar a demonstracao do projeto.
"""
import json
from nqlNltk import queryTreat, spellcheck
from flask import Flask, jsonify, render_template, request
app = Flask(__name__)

feeds = json.load(open("feeds.json"))

@app.route('/run_query')
def add_numbers():
    query = request.args.get('query', '')

    corrections = spellcheck(query)

    try:
        if len(corrections) > 0:
            print map(lambda p: {'wrong': p[0], 'right': p[1]}, corrections)
            print '-'
            print jsonify(map(lambda p: {'wrong': p[0], 'right': p[1]}, corrections))
            return jsonify(result='error', corrections=map(lambda p: {'wrong': p[0], 'right': p[1]}, corrections))
        r = queryTreat(query)
    except Exception, e:
        r = "[!] Erro: verifique o console."
        print str(e)

    print 'Query:', query
    print 'Resultado:', r

    return jsonify(result=r)


@app.route('/')
def index():
    return render_template('index.html', feeds=feeds)

if __name__ == '__main__':
    app.run()