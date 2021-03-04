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
delByNum([_|T],0,T):-!.
delByNum([H|T],N,[H|T1]):-N1 is N-1,delByNum(T,N1,T1).

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

% Exc 17
lenght([],N,N):-!.
lenght([_|Tail],I,N):-NewI is I+1,lenght(Tail,NewI,N).
lenght(List,N):-lenght(List,0,N).


% Exc 1.9
%isIt([H|_],H):-!.
%isIt(List,El):-delByNum(List,0,Tail),isIt(Tail,El).
%beforeLastMin(List):-minListUp(List,Min),reverse(List,RevList),
%    isIt(RevList,Min),write(RevList).

% Exc 1.10
sameByMean([],_,0):-!.
sameByMean([H1|List1],List2,N):-sameByMean(List1,List2,N1),
    (member(H1,List2),N is N1+1;not(member(H1,List2)),N is N1),!.

sameByMean:-write("Число элементов в первом массиве: "),read(N1),nl,
    write("Элементы первого массива: "),readList(N1,List1),nl,
    write("Число элементов во втором массиве: "),read(N2),nl,
    write("Элементы второго массива: "),readList(N2,List2),nl,
    sameByMean(List1,List2,N),
    write("Схожих по значению: "),write(N),nl,!.


% Exc 1.22
%countMinInInter([],_,_,9999,0):-!.
%countMinInInter([H|Tail],A,B,Min,N):-countMinInInter(Tail,A,B,Min,N1),
%    (H>A,H<B,H=:=Min,N is N1+1;not(H>A,H<B,H=:=Min),N is N1).
% countMinInInter(List,A,B,N):-minListUp(List,Min),countMinInInter(List%,A,B,Min,N).

% Exc 1.24
max(X,Y,X):-X>Y,!.
max(_,Y,Y):-!.

maxListUp([],0):-!.
maxListUp([H|List],Max):-maxListUp(List,NewMax),max(NewMax,H,Max).

twoMaxEl(List,Max1,Max2):-maxListUp(List,Max1),
    delAll(List,Max1,NewList),maxListUp(NewList,Max2),!.

twoMaxEl:-write("Размер массива = "),read(N),nl,
    write("Введите элементы: "),readList(N,List),nl,
    twoMaxEl(List,Max1,Max2),write("Max1 = "),write(Max1),nl,
    write("Max2 = "),write(Max2).

% Exc 1.31
countOfEven([],0):-!.
countOfEven([H|List],N):-countOfEven(List,N1),(H mod 2 =:= 0,N is N1+1;
    H mod 2 =\= 0, N is N1),!.
countOfEven:-write("Размер массива = "),read(N),nl,
    write("Введите элементы: "),readList(N,List),nl,
    countOfEven(List,Count),
    write("Четных чисел: "),write(Count),nl,!.
