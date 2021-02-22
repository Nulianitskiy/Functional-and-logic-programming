max(X,Y,X):-X>Y.
max(_,Y,Y).

max(X,Y,Z,X):-X>=Y,X>=Z,!.
max(_,Y,Z,Y):-Y>=Z,!.
max(_,_,Z,Z):-!.

factUp(1,1):-!.
factUp(N,X):-N1 is N-1, factUp(N1,X1),X is N*X1.

fD(1,CurX,CurX):-!.
fD(N,CurX,X):-N1 is N-1, CurX1 is CurX*N,fD(N1,CurX1,X).
factDown(N,X):-fD(N,1,X).
