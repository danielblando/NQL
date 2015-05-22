flex lex_rules.l
clang lex_main.c lex_tokens.h lex.yy.c -lm
