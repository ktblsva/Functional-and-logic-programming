%вариант 2
task12():-read(List),task12Check(List,Result),write(Result).

task12Check([Head|Tail],[Head|Tail2]):- contains(Head,Tail),!, remove(Tail,Head,NewTail),task12Check(NewTail,Tail2).
task12Check([Head|Tail],[Head|Tail2]):- !,task12Check(Tail,Tail2).
task12Check([],[]).

contains(X,[X|_]).
contains(X,[_|L]) :- contains(X,L).

remove([ ], _, [ ]):-!.
remove([Y|Tail], Y, L):-remove(Tail, Y, L),!.
remove( [Z|Tail], Y, [ Z|Tail1]):-remove(Tail, Y,Tail1).


task22():-read(String),open("text.txt",read,File),set_input(File),readFile(File,Strings),close(File),task22Check(Strings,Result,String),open("out.txt",write,OutFile),writeFile(OutFile,Result),close(OutFile).

readFile(_,[]):- at_end_of_stream,!.
readFile(File,[Head|Tail]):- read_line_to_codes(File,COD), string_codes(Head,COD),readFile(File,Tail).

writeFile(_,[]).
writeFile(File,[Head|Tail]):-writeln(File,Head),writeFile(File,Tail).

task22Check([Head|Tail],[Head|Tail2], String):- sub_string(Head,_,_,_,String),!,task22Check(Tail,Tail2,String).
task22Check([Head|Tail],List, String):-!,task22Check(Tail,List,String).
task22Check([],[],_).
