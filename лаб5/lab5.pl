odd(X) :- X mod 2 =\= 0.

printOdd(X,Y) :-
	odd(Y),
	writeln(Y), fail.

printOdd(X, Y) :-
	Y \== X, Y1 is Y - 1, printOdd(X,Y1).

odd() :- writeln('Enter [a, b]:'), read(X), read(Y), printOdd(X, Y).

fibonacciCalc(0, F):- F is 1, !.
fibonacciCalc(1, F):- F is 1, !.
fibonacciCalc(X, F):- X1 is X-2, X2 is X-1,fibonacciCalc(X1, F1), fibonacciCalc(X2, F2), F is F1+F2.

fibonacci():- writeln("Enter positive number for continue or negative for exit."), repeat, read(X),(X < 0, !; fibonacciCalc(X, F), writeln(F), nl, fail).
