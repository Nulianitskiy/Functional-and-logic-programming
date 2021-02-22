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

fibUp(2,1):-!.
fibUp(N,X):-N1 is N-1, fibUp(N1,X1), X is X+X1.

fibD(2,_,NextX,NextX):-!.
fibD(N,LastX,NextX,X):-N1 is N-1, NextX1 is LastX+NextX, fibD(N1,NextX,NextX1,X).
fibDown(N,X):-fibD(N,1,1,X).

sumNumUp(0,0):-!.
sumNumUp(X,S):-X1 is X div 10, sumNumUp(X1,S1), S is S1 + X mod 10.

sumNumD(0,S,S):-!.
sumNumD(X,Cur,S):-X1 is X div 10, Cur1 is Cur + X mod 10,sumNumD(X1,Cur1,S).
sumNumDown(X,S):-sumNumD(X,0,S).
