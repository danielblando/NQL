flex lex_rules.l
gcc -o progLex lex_main.c lex_tokens.h lex.yy.c -lm
bison -d yacc.y
gcc -o progParse *.c *.h
./progParse