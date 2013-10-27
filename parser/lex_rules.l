%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "yacc.tab.h"

void cleanString(char* string);
%}

%x COMMENT STRING


DIGITS		[0-9]
CHAR		[a-zA-Z_][a-zA-Z0-9_]*
HEXA		[a-fA-F0-9]
SELECT      selecionar|escolher
INSERT		inserir|introduzir|intercalar
UPDATE		atualizar|modernizar
DELETE		apagar|anular|cancelar
FROM		de
WHERE		onde|aonde|com
GROUP_BY	agrupar|associar|combinar
HAVING		ter|haver|possuir
ORDER_BY	ordenar|dispor|arranjar
JOIN		ligar|juntar|unir


%%
[ \t\n]+			{ }

"/*"				{BEGIN(COMMENT);}
<COMMENT>{
[ \t\n]+			{ }
.				{ }
"*/"				{BEGIN(INITIAL);}
}

"\""([^"\""\n\\]|\\[^\n])*"\""	{yylval.string = (char*) malloc(strlen(yytext));
				 strcpy(yylval.string,yytext);
				 cleanString(yylval.string);
				 return TK_STRING;}

{SELECT}			{return TK_SELECT;}
{INSERT}			{return TK_INSERT;}
{UPDATE}			{return TK_UPDATE;}
{DELETE}			{return TK_DELETE;}
{FROM}              {return TK_FROM;}
{WHERE}				{return TK_WHERE;}
{GROUP_BY}			{return TK_GROUPBY;}
{HAVING}			{return TK_HAVING;}
{ORDER_BY}			{return TK_ORDERBY;}
{JOIN}				{return TK_JOIN;}

"=="				{return TK_IQUALIQUAL;}
">="				{return TK_GREATERORIQUAL;}
"<="				{return TK_LESSOREQUAL;}
"||"				{return TK_OR;}
"&&"				{return TK_AND;}

(""|"-"){DIGITS}+		{yylval.intNumber = atoi(yytext);
				 return TK_INTERGER;}

("+"{DIGITS}+|""|"-"{DIGITS}+){DIGITS}*(""|"."{DIGITS}*)(""|"e"("+"|"-"|""){DIGITS}+) {yylval.floatNumber =  (float) atof(yytext);
								     	  	       return TK_FLOATNUMBER;}

{CHAR}+				{yylval.string = (char*) malloc(sizeof(yytext));
			 	 strcpy(yylval.string, yytext);
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



