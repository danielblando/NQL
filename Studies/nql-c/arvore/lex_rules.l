%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "yacc.tab.h"

void cleanString(char* string);
%}

%x COMMENT STRING


DIGITS			[0-9]
CHAR			[a-zA-Z_][a-zA-Z0-9_]*
HEXA			[a-fA-F0-9]
SELECT      	selecionar|escolher
INSERT			inserir|introduzir|intercalar
UPDATE			atualizar|modernizar
DELETE			apagar|anular|cancelar
FROM			de
WHERE			onde|aonde|com
GROUP_BY		agrupar|associar|combinar
HAVING			ter|haver|possuir
ORDER_BY		ordenar|dispor|arranjar
JOIN			ligar|juntar|unir
AND				e|,
EQUALEQUAL		igual
LESSTHAN		menor
GREATHERTHAN	maior
NOTEQUAL		diferente
LESSOREQUAL		maiorigual
GREATHEROREQUAL	menorigual
COUNT			quantidade
AVG				media
MIN				minimo
MAX				maximo
SUM				soma
FIRST			primeiro
LAST			ultimo
LEN				comprimento

%%
[ \t\n]+			{ }

"/*"				{BEGIN(COMMENT);}
<COMMENT>{
[ \t\n]+			{ }
.					{ }
"*/"				{BEGIN(INITIAL);}
}

"\""([^"\""\n\\]|\\[^\n])*"\""	{yylval.string = (char*) malloc(strlen(yytext));
				 strcpy(yylval.string,yytext);
				 cleanString(yylval.string);
				 return TK_STRING;}

{SELECT}			{printf("select \n");return TK_SELECT;}
{INSERT}			{printf("insert \n");return TK_INSERT;}
{UPDATE}			{printf("update \n");return TK_UPDATE;}
{DELETE}			{printf("delete \n");return TK_DELETE;}
{FROM}              {printf("from \n"); return TK_FROM;}
{AND}				{printf("and \n");return TK_AND;}

{WHERE}				{printf("where \n");return TK_WHERE;}
{GROUP_BY}			{printf("group by \n");return TK_GROUPBY;}
{HAVING}			{printf("having \n");return TK_HAVING;}
{ORDER_BY}			{printf("order by \n");return TK_ORDERBY;}
{JOIN}				{printf("join \n");return TK_JOIN;}

{EQUALEQUAL}		{printf("== \n");return TK_EQUALEQUAL;}
{LESSTHAN}			{printf("< \n");return TK_LESSTHAN;}
{GREATHERTHAN}		{printf("> \n");return TK_GREATHERTHAN;}
{NOTEQUAL}			{printf("!= \n");return TK_NOTEQUAL;}
{LESSOREQUAL}		{printf("<= \n");return TK_LESSOREQUAL;}
{GREATHEROREQUAL}	{printf(">= \n");return TK_GREATHEROREQUAL;}
{COUNT}				{printf("count \n");return TK_COUNT;}
{AVG}				{printf("avg \n");return TK_AVG;}
{MIN}				{printf("min \n");return TK_MIN;}
{MAX}				{printf("max \n");return TK_MAX;}
{SUM}				{printf("sum \n");return TK_SUM;}
{FIRST}				{printf("first \n");return TK_FIRST;}
{LAST}				{printf("last \n");return TK_LAST;}
{LEN}				{printf("len \n");return TK_LEN;}

">="				{return TK_GREATERORIQUAL;}
"<="				{return TK_LESSOREQUAL;}
"||"				{return TK_OR;}

(""|"-"){DIGITS}+		{yylval.intNumber = atoi(yytext);
						printf("%d \n", yylval.intNumber);
				 		return TK_INTERGER;}

("+"{DIGITS}+|""|"-"{DIGITS}+){DIGITS}*(""|"."{DIGITS}*)(""|"e"("+"|"-"|""){DIGITS}+) {yylval.floatNumber =  (float) atof(yytext);
								     	  	       return TK_FLOATNUMBER;}

{CHAR}+				{yylval.string = (char*) malloc(sizeof(yytext));
			 	 strcpy(yylval.string, yytext);
				 printf("%s \n", yylval.string);
			 	 return TK_ID;}

.				{return yytext;}
%%

void cleanString(char* string)
{
	int i = 0;
	int j = 0;
	char* result;
	result = (char*) malloc(strlen(string));
	while(string[i] != '\0')
	{
		if(string[i] == '\"')
			j--;

		else if(string[i] == '\\')
		{
			if(string[i+1] == 'n')
				result[j]='\n';
			else if(string[i+1] == 't')
				result[j]='\t';
			else if(string[i+1] == '\"')
				result[j]='\"';
			else if(string[i+1] == '\\')
				result[j]='\\\\';
			else if(string[i+1] == 'b')
				result[j]='\b';
			else if(string[i+1] == 'v')
				result[j]='\v';
			else if(string[i+1] == 'f')
				result[j]='\f';
			else if(string[i+1] == '?')
				result[j]='\?';
			else if(string[i+1] == 'r')
				result[j]='\r';
			else if(string[i+1] == '\'')
				result[j]='\'';
			else if(string[i+1] == 'a')
				result[j]='\a';
		i++;
		}
		else
			result[j] = string[i];
			
	j++;
	i++;
	}
	result[j] = '\0';
	strcpy(yylval.string,result);
}

yywrap()	{ }



