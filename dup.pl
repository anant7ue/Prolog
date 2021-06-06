
onemore(Item,[]) :- false.
onemore(Item, [H|T]) :- H =:= Item ; onemore(Item, T).
dup(Item, [H|T]) :- H =:= Item, onemore(Item, T) ; dup(Item,T).
%chkdup(X, L) :- findall(X, dup(X, L), L). 

isOnce(A, [A|_]).
isOnce(A, [_|L]) :- isOnce(A, L).
isTwice(A, [A|L]) :- isOnce(A, L). 
isTwice(A, [_|L] ) :- isTwice(A, L).
twice(A, L) :- isTwice(A, L).

 % dup(Item, L) :- delete(L, Item, X), append([Item, Item], X, Y), same_length(Y, L).
