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

multNumUp(0,1):-!.
multNumUp(X,M):-X1 is X div 10, multNumUp(X1,M1), M is M1 * (X mod 10).

multNumD(0,M,M):-!.
multNumD(X,Cur,M):-X1 is X div 10, Cur1 is Cur * (X mod 10), multNumD(X1,Cur1,M).
multNumDown(X,M):-multNumD(X,1,M).

maxNumNot3Up(0,0):-!.
maxNumNot3Up(X,N):-X1 is X div 10, maxNumNot3Up(X1,N1),!,
    N2 is X mod 10, not3(N2,N3), max(N1,N3,N),!.
not3(X,X):- X mod 3 =\= 0,!.
not3(_,0):-!.

maxNumNot3D(0,Max,Max):-!.
maxNumNot3D(X,Max,N):-X1 is X div 10, N1 is X mod 10, not3(N1,N2),
    max(Max,N2,Max1), maxNumNot3D(X1,Max1,N),!.
maxNumNot3Down(X,N):-maxNumNot3D(X,0,N).

