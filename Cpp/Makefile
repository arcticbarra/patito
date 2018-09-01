littleDuck.tab.c littleDuck.tab.h: littleDuck.y
	bison -d littleDuck.y

lex.yy.c: littleDuck.l littleDuck.tab.h
	flex littleDuck.l

littleDuck: lex.yy.c littleDuck.tab.c littleDuck.tab.h
	g++ littleDuck.tab.c lex.yy.c -lfl -o littleDuck