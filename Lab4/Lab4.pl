% Задание 1
writeList([]):-!.
writeList([H|T]):-write(H),write(" "),writeList(T).

readList(N,L):-rList(N,0,[],L).
rList(N,N,L,L):-!.
rList(N,I,CurL,L):-I1 is I+1, read(X),append(CurL,[X],CurL1),rList(N,I1,CurL1,L).

% Задание 2
sumListDown(List,Sum):-sListD(List,0,Sum).
sListD([],Sum,Sum):-!.
sListD([H|L],CurSum,Sum):-CurSum1 is CurSum + H, sListD(L,CurSum1,Sum).

readSumWriteList(N):-
    readList(N,L),
    sumListDown(L,Sum),
    nl, write("Sum = "),write(Sum),nl,fail.

% Задание 3
sumListUp([],0):-!.
sumListUp([H|List],Sum):-sumListUp(List,SumNew),Sum is SumNew + H.


% Задание 4
listElNumb([H|_],H,0):-!.
listElNumb([_|List],Elem,Numb):-listElNumb(List,Elem,NewNumb),Numb is NewNumb+1.

% Задание 4_2
readListElNumb(N):-
    write("Список: "),readList(N,List),nl,
    write("Элемент: "),read(Elem),nl,
    write("Результат: "),listElNumb(List,Elem,X),
    write(X),nl,false.

% Задание 5
readListNumbEl(N):-
    write("Список: "),readList(N,List),nl,
    write("Номер: "),read(Numb),nl,
    write("Результат: "),listElNumb(List,X,Numb),
    write(X),nl,false.

% Задание 6
min(X,Y,X):-X<Y,!.
min(_,Y,Y):-!.

minListUp([],9999):-!.
minListUp([H|List],Min):-minListUp(List,NewMin),min(NewMin,H,Min).

% Задание 7
minListDown(List,Min):-minLD(List,9999,Min).
minLD([],Min,Min):-!.
minLD([H|L],CurMin,Min):-min(CurMin,H,NewCurMin),minLD(L,NewCurMin,Min).

% Задание 8
readMinList(N):-
    write("Список: "),readList(N,List),nl,
    write("Результат: "),minListUp(List,X),
    write(X),nl,false.

% Задание 9
member(X,[X,_]):-!.
member(X,[_|T]):-member(X,T).

% Задание 10
reverse(L,X):-rev(L,[],X).
rev([],X,X):-!.
rev([H|T],CurL,X):-rev(T,[H|CurL],X).

% Задание 11
p([],[]):-!.
p([HS|Sublist],[HL|List]):-p(Sublist,List),HS =:= HL.

% Задание 12
delByNumb(List,[_|List],0):-!.
delByNumb([H|List1],[H|List2],Numb):-N is Numb - 1, delByNumb(List1,List2,N).

% Задание 13
delAll([],_,[]):-!.
delAll([H|T],El,[H|T1]):-H=\=El,delAll(T,El,T1),!.
delAll([_|T],El,T1):-delAll(T,El,T1).

% Exc 14
isU(_,[]):-!.
isU(X,[H|T]):- X =\= H,isU(X,T).
isUnique([H|T]):-isU(H,T),isUnique(T).
isUnique([]):-!.

% Exc 15
makeUnique([],[]):-!.
makeUnique([H|T],[H|T1]):-delAll([H|T],H,New),makeUnique(New,T1).

% Exc 16
counter([],_,Count,Count):-!.
counter([H|T],El,Num,Count) :-
    (H =:= El -> NewNum is Num+1;NewNum is Num),
    counter(T,El,NewNum,Count).
counter(List,El,Count):-counter(List,El,0,Count).
