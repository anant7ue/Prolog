
checkAll(H, T, X) :- H > 2, T > 1, M is H-2, N is T-1, append([M], [N], X).
checkAll(H, T, X) :- H > 1, T > 2, M is H-1, N is T-2, append([M], [N], X).
checkAll(H, T, X) :- H < 7, T < 8, M is H+2, N is T+1, append([M], [N], X).
checkAll(H, T, X) :- H < 8, T < 7, M is H+1, N is T+2, append([M], [N], X).
checkAll(H, T, X) :- H < 7, T > 1, M is H+2, N is T-1, append([M], [N], X).
checkAll(H, T, X) :- H > 1, T < 7, M is H-1, N is T+2, append([M], [N], X).
checkAll(H, T, X) :- H > 2, T < 8, M is H-2, N is T+1, append([M], [N], X).
checkAll(H, T, X) :- H < 8, T > 2, M is H+1, N is T-2, append([M], [N], X).

kmove([H|T], X) :- checkAll(H, T, X).
