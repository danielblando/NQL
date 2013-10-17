#include <stdio.h>
#include "lex_tokens.h"

int getToken(void)
{
	globalToken = yylex();
	return globalToken;
}

extern Union var;

int main (void)
{
	globalToken = -1;
	while( globalToken )
	{
		getToken();
		switch(globalToken)
		{
			case TK_ID: 
						printf("TK_ID - %s\n", var.String);
						break;
			case TK_SELECT: 
			{
						printf("TK_SELECT\n");
						break;
			}
			case TK_INSERT: 
			{
						printf("TK_INSERT\n");
						break;
			}
			case TK_UPDATE: 
			{
						printf("TK_UPDATE\n");
						break;
			}
			case TK_DELETE:
			{ 
						printf("TK_DELETE\n");
						break;
			}
			case TK_WHERE:
			{
						printf("TK_WHERE\n");
						break;
		    }
			case TK_GROUPBY:
			{
						printf("TK_GROUPBY\n");
						break;
		    }
			case TK_HAVING:
			{
						printf("TK_HAVING\n");
						break;
		    }
			case TK_ORDERBY:
			{
						printf("TK_ORDERBY\n");
						break;
		    }
			case TK_JOIN:
			{
						printf("TK_JOIN\n");
						break;
		    }			
			case TK_IQUALIQUAL: printf("TK_IQUALIQUAL\n");
							  break;
			case TK_PLUSPLUS: printf("TK_PLUSPLUS\n");
							  break;
			case TK_MINUSMINUS: printf("TK_MINUSMINUS\n");
							  break;
			case TK_GREATERORIQUAL: printf("TK_GREATERORIQUAL\n");
							  break;
			case TK_LESSOREQUAL: printf("TK_LESSOREQUAL\n");
							  break;
			case TK_PLUSEQUAL: printf("TK_PLUSEQUAL\n");
							  break;
			case TK_LESSEQUAL: printf("TK_LESSEQUAL\n");
							  break;
			case TK_MULTEQUAL: printf("TK_MULTEQUAL\n");
							  break;
			case TK_DIVEQUAL: printf("TK_DIVEQUAL\n");
							  break;
			case TK_OR: printf("TK_OR\n");
							  break;
			case TK_AND: printf("TK_AND\n");
							  break;
			case TK_INT: printf("TK_INT\n");
							  break;
			case TK_CHAR: printf("TK_CHAR\n");
							  break;
			case TK_FLOAT: printf("TK_FLOAT\n");
							  break;
			case TK_VOID: printf("TK_VOID\n");
							  break;
			case TK_IF: printf("TK_IF\n");
							  break;
			case TK_ELSE: printf("TK_ELSE\n");
							  break;
			case TK_WHILE: printf("TK_WHILE\n");
							  break;
			case TK_DO: printf("TK_DO\n");
							  break;
			case TK_NEW: printf("TK_NEW\n");
							  break;
			case TK_TRIPOINTS: printf("TK_TRIPOINTS\n");
							  break;
			case TK_RETURN: printf("TK_RETURN\n");
							  break;
			case TK_STRING: printf("TK_STRING - %s\n", var.String);
							  break;
			case TK_INTERGER: printf("TK_INTERGER - %1d\n", var.intNumber);
							  break;
			case TK_FLOATNUMBER: printf("TK_FLOATNUMBER - %1.5f\n", var.floatNumber);
							  break;
			default: printf("TOKEN UNARIO - %s\n", globalToken);
		}
	}
	return 0;
}
