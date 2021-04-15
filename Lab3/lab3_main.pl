% Exc 1
max(X,Y,X):-X>Y,!.
max(_,Y,Y):-!.

% Exc 2
max(X,Y,Z,X):-X>=Y,X>=Z,!.
max(_,Y,Z,Y):-Y>=Z,!.
max(_,_,Z,Z):-!.

% Exc 3
factUp(1,1):-!.
factUp(N,X):-N1 is N-1, factUp(N1,X1),X is N*X1.

% Exc 4
fD(1,CurX,CurX):-!.
fD(N,CurX,X):-N1 is N-1, CurX1 is CurX*N,fD(N1,CurX1,X).
factDown(N,X):-fD(N,1,X).

% Exc 5
fibUp(2,1):-!.
fibUp(N,X):-N1 is N-1, fibUp(N1,X1), X is X+X1.

% Exc 6
fibD(2,_,NextX,NextX):-!.
fibD(N,LastX,NextX,X):-N1 is N-1, NextX1 is LastX+NextX, fibD(N1,NextX,NextX1,X).
fibDown(N,X):-fibD(N,1,1,X).

% Exc 7
sumNumUp(0,0):-!.
sumNumUp(X,S):-X1 is X div 10, sumNumUp(X1,S1), S is S1 + X mod 10.

% Exc 8
sumNumD(0,S,S):-!.
sumNumD(X,Cur,S):-X1 is X div 10, Cur1 is Cur + X mod 10,sumNumD(X1,Cur1,S).
sumNumDown(X,S):-sumNumD(X,0,S).

% Exc 9
multNumUp(0,1):-!.
multNumUp(X,M):-X1 is X div 10, multNumUp(X1,M1), M is M1 * (X mod 10).

% Exc 10
multNumD(0,M,M):-!.
multNumD(X,Cur,M):-X1 is X div 10, Cur1 is Cur * (X mod 10), multNumD(X1,Cur1,M).
multNumDown(X,M):-multNumD(X,1,M).

% Exc 11
maxNumNot3Up(0,0):-!.
maxNumNot3Up(X,N):-X1 is X div 10, maxNumNot3Up(X1,N1),!,
    N2 is X mod 10, not3(N2,N3), max(N1,N3,N),!.
not3(X,X):- X mod 3 =\= 0,!.
not3(_,0):-!.

maxNumNot3D(0,Max,Max):-!.
maxNumNot3D(X,Max,N):-X1 is X div 10, N1 is X mod 10, not3(N1,N2),
    max(Max,N2,Max1), maxNumNot3D(X1,Max1,N),!.
maxNumNot3Down(X,N):-maxNumNot3D(X,0,N).

% Exc 12
nod(A,A,A) :- !.
nod(A,B,D) :- A>B, !, C is A-B, nod(C,B,D).
nod(A,B,D) :- C is B-A, nod(A,C,D).

prime(X):-prim(X,X),!.
prim(2,_):-!.
prim(CurX,X):-NewCurX is CurX-1,prim(NewCurX,X),X mod NewCurX =\= 0.

divsCount(X,N):-divsC(X,X,N),!.
divsC(_,0,0):-!.
divsC(X,CurX,N):-
    X mod CurX =:= 0, NewCurX is CurX-1,divsC(X,NewCurX,NewN),N is NewN + 1;
    X mod CurX =\= 0, NewCurX is CurX-1,divsC(X,NewCurX,NewN), N is NewN.

% Exc 13
strangeIter(1,1):-!.
strangeIter(X,N):-
    X mod 2 =:= 0, NewX is X div 2,strangeIter(NewX,NewN),N is NewN+1,!;
    X mod 2 =\= 0, NewX is X*3 + 1,strangeIter(NewX,NewN),N is NewN+1,!.

strCount(Max,Max,1000000):-!.
strCount(Cur,Max,Num):-NewNum is Num+1,strangeIter(NewNum,Len),max(Len,Cur,NewMax),
    strCount(NewMax,Max,NewNum).
strangeCounter(Cur,Num):-strCount(Cur,Max,Num),write(Max).

% Exc 14
countNotPrimeNODsUp(X,N):-countNPNODs(X,X,N),!.
countNPNODs(_,1,0):-!.
countNPNODs(X,Cur,N):-Cur mod 2 =:= 0,NewCur is Cur-1,countNPNODs(X,NewCur,NewN),
    nod(X,NewCur,Num), (Num =:= 1, N is NewN ; Num =\= 1, N is NewN+1);
    Cur mod 2 =\= 0, NewCur is Cur-1, countNPNODs(X,NewCur,NewN), N is NewN.

countNotPrimeNODsDown(X,N):-cNPNODsD(X,0,0,N),!.
cNPNODsD(X,X,N,N):-!.
cNPNODsD(X,CurX,CurN,N):-CurX mod 2 =:= 0, NewCurX is CurX+1, nod(X,NewCurX,Num),
    (Num =:= 1, NewCurN is CurN; Num =\= 1, NewCurN is CurN+1),
       cNPNODsD(X,NewCurX,NewCurN,N);
    CurX mod 2 =\= 0, NewCurX is CurX+1,NewCurN is CurN,cNPNODsD(X,NewCurX,NewCurN,N).

% BrainFuck
min(X,Y,X):-X<Y,!.
min(_,Y,Y):-!.

brainFuck(X,Y):-maxNumNot3Down(X,MaxNum),bF(X,MaxNum,Y),!.
bF(1,_,9999):-!.
bF(X,Max,Y):-NewX is X - 1,prime(NewX),bF(NewX,Max,NewY),
    nod(NewX,Max,Num),(Num=:=1,min(Y,NewY,Y);Num=\= 1, Y is Y);
    not(prime(NewX)),bF(NewX,Max,NewY),min(Y,NewY,Y).



% FuckTheWorld

fuckTheWorld(X):-maxNum(X,Max),getNotPr(X,0,0,N1,Max),
    minNum(X,Min),getNotPr(X,0,0,N2,Min),(N1 =:=0->writeln("N1 = 0"),fail;
                                         N2=:=0->writeln("N1 = 0"),fail;
    nod(N1,N2,Rez),(Rez=:=1->writeln("Числа простые"),writeln(N1),writeln(N2);
                   write("Числа не простые"),writeln(N1),writeln(N2))).

getNotPr(X,X,N,N,_):-!.
getNotPr(X,CurX,CurN,N,El):-NewCurX is CurX+1, nod(El,NewCurX,Num),
    (Num =:= 1, NewCurN is CurN; Num =\= 1, NewCurN is CurN+1),
       getNotPr(X,NewCurX,NewCurN,N,El),!.

maxNum(0,0):-!.
maxNum(X,N):-X1 is X div 10, maxNum(X1,N1),!,
    N2 is X mod 10, max(N1,N2,N),!.

min1(X,Y,X):-X<Y,!.
min1(_,Y,Y):-!.

minNum(0,9999):-!.
minNum(X,N):-X1 is X div 10, minNum(X1,N1),!,
    N2 is X mod 10, min1(N1,N2,N),!.

