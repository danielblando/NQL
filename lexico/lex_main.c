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
			case TK_FROM:
			{
						printf("TK_FROM\n");
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
			case TK_GREATERORIQUAL: printf("TK_GREATERORIQUAL\n");
							  break;
			case TK_LESSOREQUAL: printf("TK_LESSOREQUAL\n");
							  break;
			case TK_OR: printf("TK_OR\n");
							  break;
			case TK_AND: printf("TK_AND\n");
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
