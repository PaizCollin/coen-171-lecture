partition(_,[],[],[]).
partition(V, [X|XS], [X|YS], ZS) :- X =< V, partition(V,XS,YS,ZS).
partition(V, [X|XS], YS, [X|ZS]) :- X > V, partition(V,XS,YS,ZS).

quicksort([],[]).
quicksort([X|XS],S) :- partition(X,XS,L,A), quicksort(L,LS), quicksort(A,AS), append(LS,[X|AS],S).