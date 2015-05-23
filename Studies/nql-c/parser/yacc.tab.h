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
     TK_ID = 258,
     TK_GREATHERTHAN = 259,
     TK_LESSTHAN = 260,
     TK_LESSOREQUAL = 261,
     TK_GREATHEROREQUAL = 262,
     TK_EQUALEQUAL = 263,
     TK_NOTEQUAL = 264,
     TK_IN = 265,
     TK_OR = 266,
     TK_AND = 267,
     TK_SELECT = 268,
     TK_INSERT = 269,
     TK_UPDATE = 270,
     TK_DELETE = 271,
     TK_FROM = 272,
     TK_WHERE = 273,
     TK_GROUPBY = 274,
     TK_HAVING = 275,
     TK_ORDERBY = 276,
     TK_JOIN = 277,
     TK_COUNT = 278,
     TK_AVG = 279,
     TK_MIN = 280,
     TK_MAX = 281,
     TK_SUM = 282,
     TK_FIRST = 283,
     TK_LAST = 284,
     TK_LEN = 285,
     TK_INTERGER = 286,
     TK_FLOATNUMBER = 287,
     TK_STRING = 288,
     UMINUS = 289,
     TK_GREATERORIQUAL = 290,
     TK_IQUALIQUAL = 291
   };
#endif
/* Tokens.  */
#define TK_ID 258
#define TK_GREATHERTHAN 259
#define TK_LESSTHAN 260
#define TK_LESSOREQUAL 261
#define TK_GREATHEROREQUAL 262
#define TK_EQUALEQUAL 263
#define TK_NOTEQUAL 264
#define TK_IN 265
#define TK_OR 266
#define TK_AND 267
#define TK_SELECT 268
#define TK_INSERT 269
#define TK_UPDATE 270
#define TK_DELETE 271
#define TK_FROM 272
#define TK_WHERE 273
#define TK_GROUPBY 274
#define TK_HAVING 275
#define TK_ORDERBY 276
#define TK_JOIN 277
#define TK_COUNT 278
#define TK_AVG 279
#define TK_MIN 280
#define TK_MAX 281
#define TK_SUM 282
#define TK_FIRST 283
#define TK_LAST 284
#define TK_LEN 285
#define TK_INTERGER 286
#define TK_FLOATNUMBER 287
#define TK_STRING 288
#define UMINUS 289
#define TK_GREATERORIQUAL 290
#define TK_IQUALIQUAL 291




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 7 "yacc.y"
{
	float floatNumber; 
	int intNumber; 
	char* string;
}
/* Line 1529 of yacc.c.  */
#line 127 "yacc.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

