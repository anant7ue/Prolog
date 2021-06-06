
comp([H1], [H2], Z):- H1 =:= H2, Z is 1.
comp([H1|T1], [H2|T2], Z) :- H1 =:= H2, comp(T1, T2, Z).

chkpal(X):- reverse(X, Y), print(Y), comp(X, Y, Z), print(Z).
