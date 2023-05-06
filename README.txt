INDIAN INSTITUTE OF TECHNOLOGY ROPAR
CS202: PROGRAMMING PARADIGMS AND PRAGMATICS, 2023

NAME: YASH JAIN
ENTRY NUMBER: 2019EEB1208

NAME: RIYA
ENTRY NUMBER: 2019EEB1185

------------------------FOLDER STRUCTURE------------------------
*
|-BMM_Scanner.l
|-BMM_Parser.y
|-in.txt
|-out.txt
|-CorrectSample.bmm (Sample BMM source code with no errors)
|-IncorrectSample.bmm (Sample BMM source code with errors)
|-Final Project v2.0.pdf
|-README.txt


------------------------INSTRUCTIONS TO EXECUTE THE PROGRAM------------------------
Provide the input in the file "in.txt" and the output would be generated in the file "out.txt".

COMMANDS TO EXECUTE:
IN LINUX / BASH, PUT THE FOLLOWING COMMAND AND PRESS ENTER:
lex BMM_Scanner.l ; yacc -d BMM_Parser.y ; cc lex.yy.c y.tab.c -o BMM ; ./BMM in.txt

IF YOU WANT TO USE OTHER FILES FOR INPUT:
Change the filename from in.txt to the new filename at the end of the above command.
For Example:-
lex BMM_Scanner.l ; yacc -d BMM_Parser.y ; cc lex.yy.c y.tab.c -o BMM ; ./BMM CorrectSample.bmm

lex BMM_Scanner.l ; yacc -d BMM_Parser.y ; cc lex.yy.c y.tab.c -o BMM ; ./BMM IncorrectSample.bmm


- The statements and commands described for B-- were implemented. 
- The tokens to be returned are defined in the BMM_Scanner.l file. 
- The grammar for language is described in the BMM_Parser.y file. 


------------------------ERROR HANDLING------------------------
The following errors have been handled and different error messages added to the output file - 
- The line numbers should be in an ascending order.
- Lowercase letters are not allowed.
- Items should be separated by space.
- Tabs are not allowed.
- There should not be a return statement when no corresponding GOSUB statement is executed.
- The line numbers used in the IF, GOTO and GOSUB statements should exist in the program file.
- Each GOSUB statement needs a return statement post its execution.

Some of the errors are printed inline, while others are printed at the end of the output (after parsing is done).

For the errors detected, the parsing is stopped for the corresponding line and it resumes execution from the next line.


------------------------INTRODUCTION------------------------

A compiler for a simple language B-- from scratch
1. Flex & Bison are used to generate lexical analyser (or scanner) and syntax analyser (or parser) that can recognize source of code of programming language B--.
2. Meaningful error messages are generated to identify various errors in the syntax of provided sample source codes of B--.
