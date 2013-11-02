# ------------------------------------------------------------
# nql_parser.py
#
# ------------------------------------------------------------
import ply.yacc as yacc

# Get the token map from the lexer.  This is required.
from nql_lexer import tokens

def p_programa(p):
    """programa : dml
                | 
    """

def p_dml(p):
    """dml : select
            | insert
            | update
            | delete
    """

def p_select(p):
    """select : TK_SELECT columnsFuncListRec TK_FROM TK_ID clausesRec
                | TK_SELECT columnsFuncListRec TK_FROM TK_ID 
    """
    #len(p) == 5

def p_insert(p):
    """insert : TK_INSERT
    """

def p_update(p):
    """update : TK_UPDATE
    """

def p_delete(p):
    """delete : TK_DELETE
    """

def p_clauses_rec(p):
    """clausesRec : clauses
                    | clausesRec clauses
    """

def p_clauses(p):
    """clauses : claWhere
                | claGroupby
                | claHaving
                | claOrderby
                | claJoin
    """

def p_clause_where(p):
    """claWhere : TK_WHERE conditionListRec
    """
    

def p_clause_groupby(p):
    """claGroupby : TK_GROUPBY columnsFuncListRec
    """

def p_clause_having(p):
    """claHaving : TK_HAVING conditionListRec
    """

def p_clause_orderby(p):
    """claOrderby : TK_ORDERBY conditionListRec
    """

def p_cla_join(p):
    """claJoin : TK_JOIN TK_ID
    """

def p_condition_list(p):
    """conditionList : exp condition exp
    """

def p_condition_list_rec(p):
    """conditionListRec :   conditionList
                            | conditionListRec TK_AND conditionList
    """

def p_columns_func_list_rec(p):
    """columnsFuncListRec : columnsFuncList
                            | columnsFuncListRec TK_AND columnsFuncList
    """

def p_columns_func_list(p):
    """columnsFuncList : TK_ID
                        | function  TK_ID
    """

def p_condition(p):
    """condition :  TK_EQUALEQUAL           
                    | TK_LESSTHAN           
                    | TK_GREATHERTHAN       
                    | TK_NOTEQUAL           
                    | TK_LESSOREQUAL        
                    | TK_GREATHEROREQUAL
    """

def p_exp(p):
    """exp : TK_ID
            | TK_INTERGER
            | TK_FLOATNUMBER 
    """

def p_function(p):
    """function :   TK_COUNT 
                    | TK_AVG   
                    | TK_MIN   
                    | TK_MAX   
                    | TK_SUM   
                    | TK_FIRST 
                    | TK_LAST 
                    | TK_LEN
    """


# Error rule for syntax errors
def p_error(p):
    raise Exception("Syntax error in input!")

# Build the parser
parser = yacc.yacc(debug = True)

if __name__ == '__main__':
  while True:
     try:
         s = raw_input('calc > ')
     except EOFError:
         break
     if not s: continue
     result = parser.parse(s)
     print "=>", result
