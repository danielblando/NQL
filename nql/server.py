# -*- coding: utf-8 -*-
"""
    NQL - Servidor
    ~~~~~~~~~~~~~~

    Um servidor simples para facilitar a demonstracao do projeto.
"""
import json
from nql_parser import parser
from flask import Flask, jsonify, render_template, request
app = Flask(__name__)

feeds = json.load(open("feeds.json"))

@app.route('/_add_numbers')
def add_numbers():
    query = request.args.get('query', '')
    #a = request.args.get('a', 0, type=int)
    #b = request.args.get('b', 0, type=int)
    try:
        r = parser.parse(query)
    except Exception, e:
        r = str(e)
    print 'Query:', query
    print 'Resultado:', r
    return jsonify(result=r)


@app.route('/')
def index():
    return render_template('index.html', feeds=feeds)

if __name__ == '__main__':
    app.run()