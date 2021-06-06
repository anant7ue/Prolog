
dropCount([], N, K, M):- M=[].

dropCount([H|T], N, K, M) :- K mod N =:= 0, J is K+1, dropCount(T, N, J, M).

dropCount([H|T], N, K, M) :- J is K+1, dropCount(T, N, J, M2), append([H], M2, M).

dropNth(L,N, X) :- dropCount(L, N, 1, X).
