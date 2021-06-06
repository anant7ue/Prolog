
fibo(1, [1]).
fibo(2, [1, 1]).

fibo(N, Z) :- N > 2, W is N-1, fibo(W, WR), addFirst2(WR, Z).

addFirst2([H|T], X) :- getFirst(T, Y), S is H + Y, X = [S,H|T].
getFirst([H|_], X) :- X = H.

