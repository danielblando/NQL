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
     TK_PLUSPLUS = 259,
     TK_MINUSMINUS = 260,
     TK_INT = 261,
     TK_CHAR = 262,
     TK_FLOAT = 263,
     TK_VOID = 264,
     TK_IF = 265,
     TK_WHILE = 266,
     TK_DO = 267,
     TK_NEW = 268,
     TK_TRIPOINTS = 269,
     TK_RETURN = 270,
     TK_INTERGER = 271,
     TK_FLOATNUMBER = 272,
     TK_STRING = 273,
     UMINUS = 274,
     TK_LESSOREQUAL = 275,
     TK_GREATERORIQUAL = 276,
     TK_NOTEQUAL = 277,
     TK_IQUALIQUAL = 278,
     TK_AND = 279,
     TK_OR = 280,
     TK_DIVEQUAL = 281,
     TK_MULTEQUAL = 282,
     TK_LESSEQUAL = 283,
     TK_PLUSEQUAL = 284,
     ELSE = 285,
     TK_ELSE = 286
   };
#endif
/* Tokens.  */
#define TK_ID 258
#define TK_PLUSPLUS 259
#define TK_MINUSMINUS 260
#define TK_INT 261
#define TK_CHAR 262
#define TK_FLOAT 263
#define TK_VOID 264
#define TK_IF 265
#define TK_WHILE 266
#define TK_DO 267
#define TK_NEW 268
#define TK_TRIPOINTS 269
#define TK_RETURN 270
#define TK_INTERGER 271
#define TK_FLOATNUMBER 272
#define TK_STRING 273
#define UMINUS 274
#define TK_LESSOREQUAL 275
#define TK_GREATERORIQUAL 276
#define TK_NOTEQUAL 277
#define TK_IQUALIQUAL 278
#define TK_AND 279
#define TK_OR 280
#define TK_DIVEQUAL 281
#define TK_MULTEQUAL 282
#define TK_LESSEQUAL 283
#define TK_PLUSEQUAL 284
#define ELSE 285
#define TK_ELSE 286




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 7 "yacc.y"
{
	float floatNumber; 
	int intNumber; 
	char* string;
}
/* Line 1529 of yacc.c.  */
#line 117 "yacc.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

