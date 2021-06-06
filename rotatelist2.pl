
rotate1(L, N, N, L2) :- L2 = L.
rotate1([H|T], N, J, L) :- J < N, K is J+1, append(T, [H], L2), rotate1(L2, N, K, L).
rotate([H|T], N, L) :- rotate1([H|T], N, 0, L).
