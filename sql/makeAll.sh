flex lex_rules.l
bison -d yacc.y
clang *.c *.h