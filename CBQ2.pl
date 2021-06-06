
%  Anant Utgikar
% All Rights reserved.

gc([H], X) :- X = H.
gc([H|T], X) :- gc(T, Y), append(Y, H, X).

proc([H], L, X) :- H > 0, H2 is -1 * H, member(H2, L), X = [H].
proc([H], L, X) :- H > 0, H2 is -1 * H, \+ member(H2, L), X = [].
proc([H|T], L, X) :- H < 0, proc(T, L, X).
proc([H|T], L, X) :- H > 0, proc(T, L, Z), H2 is -1 * H, member(H2, L), append([H], Z, X).
proc([H|T], L, X) :- H > 0, proc(T, L, Z), H2 is -1 * H, \+ member(H2, L), X = Z.

gpnv(L, Ans) :- gc(L, X), sort(X, Y), proc(Y, Y, Z), sort(Z, Ans).

getPosNegVars(L, Ans) :- gpnv(L, Ans).



%
%
% problem 2
%
%

gc([H], X) :- X = H.
gc([H|T], X) :- gc(T, Y), append(Y, H, X).

count(H1, [H], J) :-  member(H1, H), J is 1.
count(H1, [H], J) :-  \+ member(H1, H), H2 is H1 * -1, member(H2, H), J is 1.
count(H1, [H], J) :-  \+ member(H1, H), H2 is H1 * -1, \+ member(H2, H), J is 0.
count(H1, [H|T], J) :-  count(H1, T, K), member(H1, H), J is K + 1.
count(H1, [H|T], J) :-  count(H1, T, K), \+ member(H1, H), H2 is H1 * -1, member(H2, H), J is K + 1.
count(H1, [H|T], J) :-  count(H1, T, K), \+ member(H1, H), H2 is H1 * -1, \+ member(H2, H), J is K.

setpos(H, H1) :- H > 0, H1 = H.
setpos(H, H1) :- H < 0, H1 is H * -1.

chkAdd([H], L, N, X) :- count(H, L, J), J > N, X = [H].
chkAdd([H], L, N, X) :- count(H, L, J), J =< N, X = [].

chkAdd([H|T], L, N, X) :- chkAdd(T, L, N,  Y), setpos(H, H1), count(H, L, J), J > N, append([H1], Y, X).
chkAdd([H|T], L, N, X) :- chkAdd(T, L, N, Y), count(H, L, J), J =< N, X = Y.

vgf(L, N, X) :- gc(L, L2), sort(L2, M), chkAdd(M, L, N, Y), sort( Y, X).

varsGtFr(L, N, Ans) :- vgf(L, N, Ans).

