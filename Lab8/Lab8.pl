unique_elems([], []):- !.
unique_elems([H|T], List2):- unique_elems([H|T], List2, []).
unique_elems([], CurList, CurList):- !.
unique_elems([H|T], List, []):- unique_elems(T, List, [H]), !.
unique_elems([H|T], List, CurList):-
	not(contains(CurList, H)), append(CurList, [H], NewList), unique_elems(T, List, NewList), !.
unique_elems([_|T], List, CurList):- unique_elems(T, List, CurList).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

read_str_f(A,N,Flag):-get0(X),r_str_f(X,A,[],N,0,Flag).
r_str_f(-1,A,A,N,N,1):-!.
r_str_f(10,A,A,N,N,0):-!.
r_str_f(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str_f(X1,A,B1,N,K1,Flag).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
 r_str(X,A,B,N,K):-K1 is
 K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

read_list_str(List):-read_str_f(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str_f(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).


reverse(A, Z):-reverse(A,Z,[]).
reverse([],Z,Z).
reverse([H|T],Z,Acc):-reverse(T,Z,[H|Acc]).

remove_from_list(List, Elem, Result) :-
	remove_from_list(List, Elem, [], Result).

remove_from_list([IH|IT], Elem, TempLeft, Result):-
	IH = Elem,
	reverse(TempLeft, TempLeftReverse),
	append(TempLeftReverse, IT, Result), !.

remove_from_list([IH|IT], Elem, TempLeft, Result):-
	not(IH = Elem),
	remove_from_list(IT, Elem, [IH|TempLeft], Result).

b_a_p_rep([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_p_rep(A,Perm):-unique_elems(A, Aun), in_list_exlude(Aun,El,Aun1),remove_from_list(A, El, A1),b_a_p_rep(A1,[El|Perm]).

build_all_perm_rep(File):-
	tell(File),
	read_str(A,_),
	not(b_a_p_rep(A,[])),
	told.

pr:-see('C:/Users/User/Prolog.txt'),
	read_list_str(A),seen,write_list_str(A).

pr5_5:-	tell('C:/Users/User/Prolog.txt'),
	write_list_str([[98],[101],[97],[100],[99]]),told.

% Exc 1

prMaxLenghtStr:- see('C:/Users/User/Prolog.txt'), read_length_str(LengthList),
    seen, max(LengthList, Max), write(Max).

read_length(N,Flag):-get0(X),r_l_str(X,N,0,Flag).
r_l_str(-1,N,N,1):-!.
r_l_str(10,N,N,0):-!.
r_l_str(_,N,K,Flag):-K1 is K+1,get0(X1),r_l_str(X1,N,K1,Flag).

read_length_str(LengthList):-read_length(N,Flag),
    read_length_str([N],LengthList,Flag).
read_length_str(LengthList, LengthList,1):-!.
read_length_str(CurLengthList,LengthList,0):-
	read_length(N,Flag),append(CurLengthList, [N],
        NewLengthList),read_length_str(NewLengthList,LengthList,Flag).

max(List, MaxEl):- max(List, 0, MaxEl).
max([],CurMax, CurMax):- !.
max([H|T], CurMax, X):- H > CurMax, NewMax is H, max(T,NewMax,X), !.
max([_|T], CurMax, X):- max(T, CurMax, X).

% Exc 2

prCountNoSpace:- see('C:/Users/User/Prolog.txt'), read_list_str(List), seen, noSpace(List,0,N),writeln(N).

noSpace([],N,N):-!.
noSpace([H|T],N,NSp):-spaceCounter(H)->NN is N+1,noSpace(T,NN,NSp);noSpace(T,N,NSp).

spaceCounter([]):-!.
spaceCounter([H|_]):-H is 32,!,fail.
spaceCounter([_|T]):-spaceCounter(T).

% Exc 3

prAveA:- see('C:/Users/User/Prolog.txt'),read_list_str(List),seen,
    countA(List,[],ListCount),average(ListCount,Ave),aveA(List,Ave).

countA([],ListCount,ListCount):-!.
countA([H|T],I,ListCount):-countAStr(H,0,CountA),append(I,[CountA],NI),
    countA(T,NI,ListCount).

countAStr([],N,N):-!.
countAStr([H|T],I,N):-(H is 65->NI is I+1,countAStr(T,NI,N);countAStr(T,I,N)).

average(Count,Ave):-average(Count,0,Sum,0,N),Ave is Sum/N.
average([],Sum,Sum,N,N):-!.
average([H|T],CSum,Sum,CN,N):-NewSum is CSum+H,NewN is CN+1,
    average(T,NewSum,Sum,NewN,N).

aveA([],_):-!.
aveA([H|T],Ave):-countAStr(H,0,CountA),(CountA>Ave->name(H1,H),writeln(H1),
                                        aveA(T,Ave);aveA(T,Ave)).
