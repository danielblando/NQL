%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include "lex_tokens.h" 
%}

%x COMMENT STRING


DIGITS		[0-9]
CHAR		[a-zA-Z_][a-zA-Z0-9_]*
HEXA		[a-fA-F0-9]
SELECT      selecionar|escolher
INSERT		inserir|introduzir|intercalar
UPDATE		atualizar|modernizar
DELETE		apagar|anular|cancelar
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

"\""([^"\""\n\\]|\\[^\n])*"\""	{var.String = (char*) malloc(strlen(yytext));
				 strcpy(var.String,yytext);
				 cleanString(var.String);
				 return TK_STRING;}

{SELECT}			{return TK_SELECT;}
{INSERT}			{return TK_INSERT;}
{UPDATE}			{return TK_UPDATE;}
{DELETE}			{return TK_DELETE;}
{WHERE}				{return TK_WHERE;}
{GROUP_BY}			{return TK_GROUPBY;}
{HAVING}			{return TK_HAVING;}
{ORDER_BY}			{return TK_ORDERBY;}
{JOIN}				{return TK_JOIN;}

"=="				{return TK_IQUALIQUAL;}
"++"				{return TK_PLUSPLUS;}
"--"				{return TK_MINUSMINUS;}
">="				{return TK_GREATERORIQUAL;}
"<="				{return TK_LESSOREQUAL;}
"+="				{return TK_PLUSEQUAL;}
"-="				{return TK_LESSEQUAL;}
"*="				{return TK_MULTEQUAL;}
"/="				{return TK_DIVEQUAL;}
"!="				{return TK_NOTEQUAL;}
"||"				{return TK_OR;}
"&&"				{return TK_AND;}
"..."				{return TK_TRIPOINTS;}
"char"				{return TK_CHAR;}
"int"				{return TK_INT;}
"float"				{return TK_FLOAT;}
"void"				{return TK_VOID;}
"if"				{return TK_IF;}
"else"				{return TK_ELSE;}
"while"				{return TK_WHILE;}
"return"			{return TK_RETURN;}
"new"				{return TK_NEW;}

(""|"-"){DIGITS}+		{var.intNumber = atoi(yytext);
				 return TK_INTERGER;}

("+"{DIGITS}+|""|"-"{DIGITS}+){DIGITS}*(""|"."{DIGITS}*)(""|"e"("+"|"-"|""){DIGITS}+) {var.floatNumber =  (float) atof(yytext);
								     	  	       return TK_FLOATNUMBER;}

"0x"{HEXA}+			{var.intNumber = hexToInt(yytext);
				 return TK_INTERGER;}

{CHAR}+				{var.String = (char*) malloc(sizeof(yytext));
			 	 strcpy(var.String, yytext);
			 	 return TK_ID;}

.				{return yytext;}
%%
int hexToInt(char* num)
{
	int i = 2, tam = strlen(num) - 3;
	int result = 0;
	while(i < strlen(num))
	{
		if(num[i] == 'a' || num[i] == 'A')
			result = result + 10*pow(16,tam);
		else if(num[i] == 'b' || num[i] == 'B')
			result = result + 11*pow(16,tam);
		else if(num[i] == 'c' || num[i] == 'C')
			result = result + 12*pow(16,tam);
		else if(num[i] == 'd' || num[i] == 'D')
			result = result + 13*pow(16,tam);
		else if(num[i] == 'e' || num[i] == 'E')
			result = result + 14*pow(16,tam);
		else if(num[i] == 'f' || num[i] == 'F')
			result = result + 15*pow(16,tam);
		else
			result = result + (num[i]-48)*pow(16,tam);
		i++;
		tam--;
	}
	return result;
}


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
	strcpy(var.String,result);
}

yywrap()	{ }



