# ------------------------------------------------------------
# nql_lexer.py
#
# ------------------------------------------------------------
import ply.lex as lex

reserved = {
  'selecionar' : 'TK_SELECT',
  'apresentar' : 'TK_SELECT',
  'apresente' : 'TK_SELECT',
  'escolher' : 'TK_SELECT',
  'mostrar' : 'TK_SELECT',
  'inserir' : 'TK_INSERT',
  'atualizar' : 'TK_UPDATE',
  'apagar' : 'TK_DELETE',
  'deletar' : 'TK_DELETE',
  
  'de' : 'TK_FROM',
  'da' : 'TK_FROM',
  'das' : 'TK_FROM',
  'do' : 'TK_FROM',
  'dos' : 'TK_FROM',
  'e' : 'TK_AND',

  'com' : 'TK_WHERE',
  'agrupar' : 'TK_GROUPBY',
  'ter' : 'TK_HAVING',
  'ordernar' : 'TK_ORDERBY',
  'ligar' : 'TK_JOIN',

  'igual' : 'TK_EQUALEQUAL',
  'menor' : 'TK_LESSTHAN',
  'maior' : 'TK_GREATHERTHAN',
  'diferente' : 'TK_NOTEQUAL',
  'menorigual' : 'TK_LESSOREQUAL',
  'maiorigual' : 'TK_GREATHEROREQUAL',

  'quantidade' : 'TK_COUNT',
  'media' : 'TK_AVG',
  'minimo' : 'TK_MIN',
  'maximo' : 'TK_MAX',
  'soma' : 'TK_SUM',
  'primeiro' : 'TK_FIRST',
  'ultimo' : 'TK_LAST',
  'comprimento' : 'TK_LEN'
}

# List of token names.   This is always required
tokens = (
   'TK_SELECT', 'TK_INSERT', 'TK_UPDATE', 'TK_DELETE',
   'TK_FROM', 'TK_AND',
   'TK_WHERE', 'TK_GROUPBY', 'TK_HAVING', 'TK_ORDERBY', 'TK_JOIN',
   'TK_EQUALEQUAL', 'TK_LESSTHAN', 'TK_GREATHERTHAN', 'TK_NOTEQUAL', 'TK_LESSOREQUAL', 'TK_GREATHEROREQUAL',
   'TK_COUNT', 'TK_AVG', 'TK_MIN', 'TK_MAX', 'TK_SUM', 'TK_FIRST', 'TK_LAST', 'TK_LEN',
   'TK_STRING', 'TK_INTERGER', 'TK_FLOATNUMBER', 'TK_ID'
)

# Regular expression rules for simple tokens

t_TK_SELECT = 'selecionar|escolher'
t_TK_INSERT = 'inserir|introduzir|intercalar'
t_TK_UPDATE = 'atualizar|modernizar'
t_TK_DELETE = 'apagar|anular|cancelar'

t_TK_FROM = 'de' 
t_TK_AND = 'e|,'

t_TK_WHERE = 'onde|aonde|com'
t_TK_GROUPBY = 'agrupar|associar|combinar'
t_TK_HAVING = 'ter|haver|possuir'
t_TK_ORDERBY = 'ordenar|dispor|arranjar'
t_TK_JOIN = 'ligar|juntar|unir'

t_TK_EQUALEQUAL = 'igual'
t_TK_LESSTHAN = 'menor'
t_TK_GREATHERTHAN = 'maior'
t_TK_NOTEQUAL = 'diferente'
t_TK_LESSOREQUAL = 'menorigual'
t_TK_GREATHEROREQUAL = 'maiorigual'

t_TK_COUNT = 'quantidade'
t_TK_AVG = 'media'
t_TK_MIN = 'minimo'
t_TK_MAX = 'maximo'
t_TK_SUM = 'soma'
t_TK_FIRST = 'primeiro'
t_TK_LAST = 'ultimo'
t_TK_LEN = 'comprimento'

def t_TK_INTERGER(t):
    r'\d+'
    t.value = int(t.value)    
    return t

def t_TK_ID(t):
    r'\w+'
    t.type = reserved.get(t.value, 'TK_ID')
    t.value = str(t.value)
    return t

# Define a rule so we can track line numbers
def t_newline(t):
    r'\n+'
    t.lexer.lineno += len(t.value)

# A string containing ignored characters (spaces and tabs)
t_ignore  = ' \t'

# Error handling rule
def t_error(t):
    raise Exception("Illegal character '%s'" % t.value[0])
    t.lexer.skip(1)

# Build the lexer
#lexer = lex.lex(debug=True)
lexer = lex.lex()
