# cs202-project
CS202 project 2023

lex BMM_Scanner.l
yacc -d BMM_Parser.y
cc lex.yy.c y.tab.c -o BMM
./BMM
