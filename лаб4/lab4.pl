parent(john, bob).
parent(mary, bob).
parent(mary, ann).
parent(bob, liz).
parent(bob, paul).
parent(bob, sam).
parent(paul, pat).

woman(mary).
woman(ann).
woman(liz).
woman(pat).

man(john).
man(bob).
man(paul).
man(sam).

father(X, Y):-man(X), parent(X, Y).

mother(X, Y):-woman(X), parent(X,Y).

brother(X, Y):-man(X), (parent(Z, X), parent(Z, Y)), X\==Y.

sister(X, Y):-woman(X), (parent(Z, X), parent(Z, Y)), X\==Y.

aunt(X, Y):- sister(X, Z), parent(Z, Y).

haveTwoChildren(X):-findall(P, parent(X, P), L), length(L, 2).
haveTwoChildre(X):-parent(X, Y), parent(X,Z),(not(parent(X, A)), A\==Y, A\==Z).
succesor(X):-man(X),parent(X, Y), man(Y).
two_child(U):-
    parent(U, Z), parent(U, Q), parent(U, Z), parent(U, Q), Z \= Q.
