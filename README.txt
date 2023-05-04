INDIAN INSTITUTE OF TECHNOLOGY ROPAR
CS202: PROGRAMMING PARADIGMS AND PRAGMATICS, 2023

NAME: YASH JAIN
ENTRY NUMBER: 2019EEB1208

NAME: RIYA
ENTRY NUMBER: 2019EEB1185

FOLDER STRUCTURE:
*
|-BMM_Scanner.l
|-BMM_Parser.y
|-in.txt
|-out.txt
|-CorrectSample.bmm (Sample BMM source code with no errors)
|-IncorrectSample.bmm (Sample BMM source code with errors)
|-README.txt


INSTRUCTIONS TO EXECUTE THE PROGRAM:
Provide the input in the file "in.txt" and the output would be generated in the file "out.txt".


IF YOU WANT TO USE OTHER FILES FOR INPUT:
Change the filename from in.txt to the new filename in the line 14 of BMM_Parser.y

COMMANDS TO EXECUTE:
IN LINUX / BASH, PUT THE FOLLOWING COMMAND AND PRESS ENTER:
lex BMM_Scanner.l ; yacc -d BMM_Parser.y ; cc lex.yy.c y.tab.c -o BMM ; ./BMM




---------------------------------------------------

INTRODUCTION:
A compiler for a simple language B-- from scratch
1. Using Flex & Bison to generate lexical analyser (or scanner) and syntax analyser (or parser) that can recognize source of code of programming language B--.
2. Generating meaningful error messages to identify various errors in the syntax of provided sample source codes of B--.
