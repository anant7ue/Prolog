

% doesnt work - top down ??

prefix([0], M, L) :- L = M.

%prefix1([], L, Pow) :- L = [1].

prefix1([H], L, Pow) :- D is Pow + H, L = [D].
prefix1([H|T], L, Pow) :- prefix1(T, L2, Pow), D is H + Pow,  append([D], L2, L).

code(N, N, L, Pow) :- L = [0], Pow = 1. 

code(N, M, L, Pow) :- M < N, K is M + 1, code(N, K, L2, CPow) , reverse(L2, L3), write(L3 + '  ' + CPow +'\n'), prefix1(L3, L4, CPow), append(L2, L4, L), Pow is 2 * CPow.

gcode(N, L) :- code(N, 0, L, Pow).
