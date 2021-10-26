odd(X) :- X mod 2 =\= 0.

printOdd(X,Y) :-
  odd(Y),
  writeln(Y), fail.

printOdd(X, Y) :-
  Y \== X, Y1 is Y - 1, printOdd(X,Y1).

printOdd(X, Y) :- X =:= Y,!.

odd() :- writeln('Enter [a, b]:'), read(X), read(Y), printOdd(X, Y).

fibonacciCalc(0, F):- F is 1, !.
fibonacciCalc(1, F):- F is 1, !.
fibonacciCalc(X, F):- X1 is X-2, X2 is X-1,fibonacciCalc(X1, F1), fibonacciCalc(X2, F2), F is F1+F2.

fibonacci():- writeln("Enter positive number for continue or negative for exit."), repeat, read(X),(X < 0, !; fibonacciCalc(X, F), writeln(F), nl, fail).

minmax(X,Y,Min,Max):- X < Y ,!, Min = X, Max = Y; Max = X, Min = Y.
split():- read(List),read(X),read(Y),minmax(X,Y,Min,Max), splitR(List,Min,Max,List1,List2,List3),write(List1),write(List2),write(List3).
splitR([Head|Tail],Min,Max,[Head|List1],List2,List3):- Head < Min,!,splitR(Tail,Min,Max,List1,List2,List3).
splitR([Head|Tail],Min,Max,List1,List2,[Head|List3]):- Head > Max,!,splitR(Tail,Min,Max,List1,List2,List3).
splitR([Head|Tail],Min,Max,List1,[Head|List2],List3):- !,splitR(Tail,Min,Max,List1,List2,List3).
splitR([],Min,Max,[],[],[]).

pu_sort(L,Sort_list):-swap(L,L1),!,pu_sort(L1,Sort_list).
pu_sort(L,L).
swap([X,Y|Tail],[Y,X|Tail]):-X@>Y.
swap([X|Tail],[X|Tail1]):-swap(Tail,Tail1).

frequence():- read(List),pu_sort(List,[Head|Tail]), counters([Head|Tail], 0, 0, Head, ResultList, FinaleResult),pu_sort(FinaleResult,SortResult),write(SortResult).

counters([Head|Tail],Counter,MaxCounter,P, Result, AnotherFinaleResult):- P =:= Head,!, Counter1 is Counter + 1,counterChecker(P, Counter1, MaxCounter,MaxCounterResult, Result,FinaleResult),counters(Tail,Counter1,MaxCounterResult,P,FinaleResult,AnotherFinaleResult).
counters([Head|Tail],Counter,MaxCounter,P, Result, AnotherFinaleResult):- P \= Head,!, Counter1 = 0, counters([Head|Tail],Counter1,MaxCounter,Head,Result,AnotherFinaleResult).
counters([],Counter,MaxCounter,P, Result, AnotherFinaleResult) :- !, AnotherFinaleResult = Result.

insert(X,L,[X|L]).

counterChecker(P,Counter, MaxCounter,MaxCounterResult, ResultList,FinaleResult) :- Counter =:= MaxCounter,!, insert(P,ResultList,FinaleResult), MaxCounterResult = MaxCounter.
counterChecker(P,Counter, MaxCounter,MaxCounterResult, ResultList, [P|[]]) :- Counter > MaxCounter,!,MaxCounterResult = Counter.
counterChecker(P,Counter, MaxCounter,MaxCounterResult, ResultList,FinaleResult) :- !, MaxCounterResult = MaxCounter, FinaleResult = ResultList.
