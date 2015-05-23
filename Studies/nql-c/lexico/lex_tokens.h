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
	TK_GREATERORIQUAL,
	TK_LESSOREQUAL,
	TK_IQUALIQUAL,
	TK_NOTEQUAL,
	TK_OR,
	TK_AND,
	TK_STRING,
	TK_SELECT,
	TK_INTERGER,
	TK_FLOATNUMBER,
	TK_INSERT,
	TK_UPDATE,
	TK_DELETE,
	TK_FROM,
	TK_WHERE,
	TK_GROUPBY,
	TK_HAVING,
	TK_ORDERBY,
	TK_JOIN
	
} TOKEN;
