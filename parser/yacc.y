%{
    #include<stdio.h> 
    int yyerror(char const *s);
    int yylex(void);
%}

%union {
	float floatNumber; 
	int intNumber; 
	char* string;
}

%token  TK_ID TK_PLUSPLUS TK_MINUSMINUS TK_INT TK_CHAR TK_FLOAT TK_VOID TK_IF TK_WHILE TK_DO TK_NEW TK_TRIPOINTS TK_RETURN

%token<intNumber> TK_INTERGER
%token<floatNumber> TK_FLOATNUMBER
%token<string> TK_STRING

%error-verbose
%right '='
%left '|'
%left '&'
%left '+' '-'
%left '*' '/' '%'
%left UMINUS 
%left '<' '>'
%left TK_GREATERORIQUAL TK_LESSOREQUAL 
%left TK_IQUALIQUAL TK_NOTEQUAL
%left TK_OR TK_AND
%left TK_PLUSEQUAL TK_LESSEQUAL TK_MULTEQUAL TK_DIVEQUAL
%nonassoc ELSE
%nonassoc TK_ELSE
%start programa

%%
programa : declaracao 
	   | /*vazio*/  ;

declaracao :  declaracao decVariavel 
		| declaracao decFuncao 
		| decVariavel
		| decFuncao;

decVariavel : tipo listaNomes ';' ;

decVariavelRec : decVariavel
		| decVariavelRec decVariavel ;

listaNomes : TK_ID 
		| listaNomes ',' TK_ID ;

tipo : tipoBase 
	| tipo '[' ']' ;

tipoBase : TK_INT 
		| TK_CHAR 
		| TK_FLOAT ;

decFuncao : tipo TK_ID '(' parametrosRec ')' bloco 
		 | TK_VOID TK_ID '(' parametrosRec ')' bloco
		 | tipo TK_ID '(' ')' bloco 
		 | TK_VOID TK_ID '(' ')' bloco ;

parametro : tipo TK_ID ;

parametrosRec : parametro 
		| parametrosRec ',' parametro ;

bloco : '{' decVariavelRec comandoRec '}' 
	|'{' decVariavelRec '}' 
	|'{'  comandoRec '}' 
	|'{' '}' ;

comando : TK_IF '(' exp ')' comando %prec ELSE
	|TK_IF '(' exp ')' comando TK_ELSE comando
        | TK_WHILE '(' exp ')' comando
        | var '=' exp ';'
        | TK_RETURN exp ';'
	| TK_RETURN ';'
        | chamada ';'
	| bloco ;

comandoRec : comandoRec comando
		| comando ;

var : TK_ID 
	| var '[' exp ']' ;

exp : var
	| '(' exp ')'
	| chamada
	| TK_NEW tipo '[' exp ']'
	| '-' exp %prec UMINUS
	| exp '+' exp
	| exp '-' exp
	| exp '*' exp
	| exp '/' exp
	| exp TK_IQUALIQUAL exp
	| exp TK_LESSOREQUAL exp
	| exp TK_GREATERORIQUAL exp
	| exp '<' exp
	| exp '>' exp
	| '!' exp %prec UMINUS
	| exp TK_AND exp
	| exp TK_OR exp
	| TK_INTERGER 
	| TK_FLOATNUMBER 
	| TK_STRING ;

chamada : TK_ID '(' ')' 
		| TK_ID '(' listaExpRec ')' ;

listaExpRec : exp 
		| listaExpRec ',' exp ;

%%
int yyerror (char const *s)
 {
   fprintf( stderr, "%s\n%d %s de sintaxe %s.\n", s, yynerrs, (yynerrs == 1)?"erro":"erros", (yynerrs == 1)?"encontrado":"encontrados"  );
    return 0;   
 }
