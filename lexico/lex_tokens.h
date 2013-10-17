/* Union para armazenar valores semânticos dos tokens */
int globalToken;

typedef union _yyUnion 
{
	float floatNumber;
	int   intNumber;
	char*  String;
} Union;

Union var;

typedef enum 
{
	TK_ID = 128,
	TK_INTERGER,
	TK_FLOATNUMBER,
	TK_IQUALIQUAL,
	TK_PLUSPLUS,
	TK_MINUSMINUS,
	TK_GREATERORIQUAL,
	TK_LESSOREQUAL,
	TK_PLUSEQUAL,
	TK_LESSEQUAL,
	TK_MULTEQUAL,
	TK_DIVEQUAL,
	TK_NOTEQUAL,
	TK_OR,
	TK_AND,
	TK_INT,
	TK_CHAR,
	TK_FLOAT,
	TK_VOID,
	TK_IF,
	TK_ELSE,
	TK_WHILE,
	TK_DO,
	TK_NEW,
	TK_TRIPOINTS,
	TK_RETURN,
	TK_STRING,
	TK_SELECT,
	TK_INSERT,
	TK_UPDATE,
	TK_DELETE,
	TK_WHERE,
	TK_GROUPBY,
	TK_HAVING,
	TK_ORDERBY,
	TK_JOIN
	
} TOKEN;
