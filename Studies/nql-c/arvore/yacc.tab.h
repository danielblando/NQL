/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     TK_GREATHERTHAN = 258,
     TK_LESSTHAN = 259,
     TK_LESSOREQUAL = 260,
     TK_GREATHEROREQUAL = 261,
     TK_EQUALEQUAL = 262,
     TK_NOTEQUAL = 263,
     TK_OR = 264,
     TK_AND = 265,
     TK_SELECT = 266,
     TK_INSERT = 267,
     TK_UPDATE = 268,
     TK_DELETE = 269,
     TK_FROM = 270,
     TK_WHERE = 271,
     TK_GROUPBY = 272,
     TK_HAVING = 273,
     TK_ORDERBY = 274,
     TK_JOIN = 275,
     TK_COUNT = 276,
     TK_AVG = 277,
     TK_MIN = 278,
     TK_MAX = 279,
     TK_SUM = 280,
     TK_FIRST = 281,
     TK_LAST = 282,
     TK_LEN = 283,
     TK_INTERGER = 284,
     TK_FLOATNUMBER = 285,
     TK_STRING = 286,
     TK_ID = 287,
     TK_GREATERORIQUAL = 288,
     TK_IQUALIQUAL = 289
   };
#endif
/* Tokens.  */
#define TK_GREATHERTHAN 258
#define TK_LESSTHAN 259
#define TK_LESSOREQUAL 260
#define TK_GREATHEROREQUAL 261
#define TK_EQUALEQUAL 262
#define TK_NOTEQUAL 263
#define TK_OR 264
#define TK_AND 265
#define TK_SELECT 266
#define TK_INSERT 267
#define TK_UPDATE 268
#define TK_DELETE 269
#define TK_FROM 270
#define TK_WHERE 271
#define TK_GROUPBY 272
#define TK_HAVING 273
#define TK_ORDERBY 274
#define TK_JOIN 275
#define TK_COUNT 276
#define TK_AVG 277
#define TK_MIN 278
#define TK_MAX 279
#define TK_SUM 280
#define TK_FIRST 281
#define TK_LAST 282
#define TK_LEN 283
#define TK_INTERGER 284
#define TK_FLOATNUMBER 285
#define TK_STRING 286
#define TK_ID 287
#define TK_GREATERORIQUAL 288
#define TK_IQUALIQUAL 289




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 8 "yacc.y"
{
	float floatNumber; 
	int intNumber; 
	char* string;
	
	struct 	programa* 	prog;
	
	struct  dml*		dml;
	struct 	dmlSelect* 	select;
	
	struct  clausesRec*			clausesRec;
	struct  clauses*			clauses;
	struct	claWhere*			where;
	struct	claGroupby*			groupBy;
	struct	claHaving*			having;
	struct	claOrderby*			orderBy;
	struct	claJoin*			join;
	
	struct  conditionListRec* 	condListRec;
	struct  conditionList* 		condList;
	
	struct  columnsFuncListRec* columnFuncListRec;
	struct  columnsFuncList*	columnFuncList;
	struct  function*			function;
	
	struct expression*			exp;
}
/* Line 1529 of yacc.c.  */
#line 145 "yacc.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

