insert(X,empty,node(empty,X,empty)).
insert(X,node(L,X,R),node(L,X,R)).
insert(X,node(L,Y,R),node(Lnew,Y,R)) :- X < Y, insert(X,L,Lnew).
insert(X,node(L,Y,R),node(L,Y,Rnew)) :- X > Y, insert(X,R,Rnew).

exists(X,node(_,X,_)).
exists(X,node(L,Y,_)) :- X < Y, exists(X,L).
exists(X,node(_,Y,R)) :- X > Y, exists(X,R).

build([], empty).
build([X|XS],T) :- build(XS,ST), insert(X,ST,T).