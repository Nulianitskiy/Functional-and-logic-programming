% ������� 1
writeList([]):-!.
writeList([H|T]):-write(H),write(" "),writeList(T).

readList(N,L):-rList(N,0,[],L).
rList(N,N,L,L):-!.
rList(N,I,CurL,L):-I1 is I+1, read(X),append(CurL,[X],CurL1),rList(N,I1,CurL1,L).

reverse(L,X):-rev(L,[],X).
rev([],X,X):-!.
rev([H|T],CurL,X):-rev(T,[H|CurL],X).

% ������� 2
sumListDown(List,Sum):-sListD(List,0,Sum).
sListD([],Sum,Sum):-!.
sListD([H|L],CurSum,Sum):-CurSum1 is CurSum + H, sListD(L,CurSum1,Sum).

readSumWriteList(N):-
    readList(N,L),
    sumListDown(L,Sum),
    nl, write("Sum = "),write(Sum),nl,fail.

% ������� 3
sumListUp([],0):-!.
sumListUp([H|List],Sum):-sumListUp(List,SumNew),Sum is SumNew + H.


% ������� 4
listElNumb([H|_],H,0):-!.
listElNumb([_|List],Elem,Numb):-listElNumb(List,Elem,NewNumb),Numb is NewNumb+1.

% ������� 4_2
readListElNumb(N):-
    write("������: "),readList(N,List),nl,
    write("�������: "),read(Elem),nl,
    write("���������: "),listElNumb(List,Elem,X),
    write(X),nl,false.

% ������� 5
readListNumbEl(N):-
    write("������: "),readList(N,List),nl,
    write("�����: "),read(Numb),nl,
    write("���������: "),listElNumb(List,X,Numb),
    write(X),nl,false.

% ������� 6
min(X,Y,X):-X<Y,!.
min(_,Y,Y):-!.

minListUp([],9999):-!.
minListUp([H|List],Min):-minListUp(List,NewMin),min(NewMin,H,Min).

% ������� 7
minListDown(List,Min):-minLD(List,9999,Min).
minLD([],Min,Min):-!.
minLD([H|L],CurMin,Min):-min(CurMin,H,NewCurMin),minLD(L,NewCurMin,Min).
