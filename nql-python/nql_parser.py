# ------------------------------------------------------------
# nql_parser.py
#
# ------------------------------------------------------------
import ply.yacc as yacc

# Get the token map from the lexer.  This is required.
from nql_lexer import tokens
from objects import *
from createSql import SqlProg
from errorHandling import parse_error


###########################################################################################
def p_programa(p):
    """programa : dml
                | 
    """
    p[0] = ProgNo(p[1])
    p[0] = SqlProg(p[0])

def p_dml(p):
    """dml : select
            | insert
            | update
            | delete
    """
    if isInstanceEqualClass(p[1],SelectNo):
        p[0] = DmlNo(DmlToken.SELECT, p[1])
    
def p_select(p):
    """select : TK_SELECT columnsFuncListRec TK_FROM TK_ID clausesRec
                | TK_SELECT columnsFuncListRec TK_FROM TK_ID 
    """
    if len(p) == 6:
        p[0] = SelectNo(p[4], p[2], p[5])
    else:
        p[0] = SelectNo(p[4],p[2])

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
    if len(p) == 3:
        p[0] = ClausesRecNo(p[2],p[1])
    else:
        p[0] = ClausesRecNo(p[1])

def p_clauses(p):
    """clauses : claWhere
                | claGroupby
                | claHaving
                | claOrderby
                | claJoin
    """
    if isInstanceEqualClass(p[1],WhereNo):
        p[0] = ClausesNo(ClaToken.WHERE, p[1])

    elif isInstanceEqualClass(p[1],GroupbyNo):
        p[0] = ClausesNo(ClaToken.GROUPBY, p[1])

    elif isInstanceEqualClass(p[1],HavingNo):
        p[0] = ClausesNo(ClaToken.HAVING, p[1])

    elif isInstanceEqualClass(p[1],OrderbyNo):
        p[0] = ClausesNo(ClaToken.ORDERBY, p[1])
        
    elif isInstanceEqualClass(p[1],JoinNo):
        p[0] = ClausesNo(ClaToken.JOIN, p[1])

def p_clause_where(p):
    """claWhere : TK_WHERE conditionListRec
    """
    p[0] = WhereNo(p[2])

def p_clause_groupby(p):
    """claGroupby : TK_GROUPBY columnsFuncListRec
    """
    p[0] = GroupbyNo(p[2])

def p_clause_having(p):
    """claHaving : TK_HAVING conditionListRec
    """
    p[0] = HavingNo(p[2])

def p_clause_orderby(p):
    """claOrderby : TK_ORDERBY columnsFuncListRec
    """
    p[0] = OrderbyNo(p[2])

def p_cla_join(p):
    """claJoin : TK_JOIN TK_ID
    """
    p[0] = JoinNo(p[2])

def p_condition_list_rec(p):
    """conditionListRec :   conditionList
                            | conditionListRec TK_AND conditionList
    """
    if len(p) == 4:
        p[0] = CondListRecNo(p[3],p[1])
    else:
        p[0] = CondListRecNo(p[1])

def p_condition_list(p):
    """conditionList : exp condition exp
    """
    p[0] = CondListNo(p[2], p[1], p[3])

def p_columns_func_list_rec(p):
    """columnsFuncListRec : columnsFuncList
                            | columnsFuncListRec TK_AND columnsFuncList
    """
    if len(p) == 4:
        p[0] = ColumnFuncListRecNo(p[3],p[1])
    else:
        p[0] = ColumnFuncListRecNo(p[1])

def p_columns_func_list(p):
    """columnsFuncList : TK_ID
                        | function  TK_ID
    """
    if len(p) == 3:
        p[0] = ColumnFuncListNo(p[2], p[1])
    else:
        p[0] = ColumnFuncListNo(p[1])

def p_condition_equalequal(p):
    """condition :  TK_EQUALEQUAL           
    """
    p[0] = CondToken.EQUALEQUAL

def p_condition_lessthan(p):
    """condition : TK_LESSTHAN
    """
    p[0] = CondToken.LESSTHAN

def p_condition_greatherthan(p):
    """condition : TK_GREATHERTHAN
    """
    p[0] = CondToken.GREATHERTHAN

def p_condition_notequal(p):
    """condition : TK_NOTEQUAL
    """
    p[0] = CondToken.NOTEQUAL

def p_condition_lessorequal(p):
    """condition : TK_LESSOREQUAL
    """
    p[0] = CondToken.LESSOREQUAL

def p_condition_greatherorequal(p):
    """condition : TK_GREATHEROREQUAL
    """
    p[0] = CondToken.GREATHEROREQUAL

def p_exp(p):
    """exp : TK_ID
            | TK_INTERGER
            | TK_FLOATNUMBER 
    """
    if isInstanceEqualClass(p[1],int):
        p[0] = ExpNo(ExpToken.INT, p[1])

    elif isInstanceEqualClass(p[1],str):
        p[0] = ExpNo(ExpToken.CHAR, p[1])

    elif isInstanceEqualClass(p[1],float):
        p[0] = ExpNo(ExpToken.FLOAT, p[1])

def p_function_count(p):
    """function :   TK_COUNT 
    """
    p[0] = FuncToken.COUNT

def p_function_avg(p):
    """function : TK_AVG
    """
    p[0] = FuncToken.AVG

def p_function_min(p):
    """function : TK_MIN
    """
    p[0] = FuncToken.MIN

def p_function_max(p):
    """function : TK_MAX
    """
    p[0] = FuncToken.MAX

def p_function_sum(p):
    """function : TK_SUM
    """
    p[0] = FuncToken.SUM

def p_function_first(p):
    """function : TK_FIRST
    """
    p[0] = FuncToken.FIRST

def p_function_last(p):
    """function : TK_LAST
    """
    p[0] = FuncToken.LAST

def p_function_len(p):
    """function : TK_LEN
    """
    p[0] = FuncToken.LEN

###########################################################################################
#Aux Functions
def isInstanceEqualClass(a,b):
    if a.__class__.__name__ == b.__name__:
        return 1
    else:
        return 0

# Error rule for syntax errors
def p_error(p, stack):
    parse_error(p, stack)

# Build the parser
parser = yacc.yacc(debug=True)


if __name__ == '__main__':
  while True:
     try:
         s = raw_input('calc > ')
     except EOFError:
         break
     if not s: continue
     result = parser.parse(s)
     print "=>", result
