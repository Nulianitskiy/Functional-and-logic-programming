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

% Exc 1
prExc1:-read_str_f(A,X,0),write_str(A),write(" , "),write_str(A),write(" , "),write_str(A),write(" , "),write(X).

% Exc 2
prExc2:-read_str(A,_),count_words(A,K),write(K).

count_words(A,K):-count_words(A,0,K).

count_words([],K,K):-!.
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[],I1 is I+1,count_words(A2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),get_word(T,W1,Word,A2).

% Exc 4
prExc4:-read_str(A,N),(N>5 -> write3(A),reverse(A,NA),write3(NA);writeFirst(A)).

write3([H1,H2,H3|_]):-name(NH1,[H1]),write(NH1),write(" "),name(NH2,[H2]),write(NH2),write(" "),name(NH3,[H3]),write(NH3),write(" ").

writeFirst([H|T]):-writeFirst(H,T),name(NH,[H]),write(NH).
writeFirst(_,[]):-!.
writeFirst(H,[_|T]):-writeFirst(H,T),name(NH,[H]),write(NH),write(" ").

% Exc 5
prExc5:-read_str(A,_),reverse(A,[H|_]),numSimbLast(A,H,0),!.

numSimbLast([],_,_):-!.
numSimbLast([El|T],El,I):-write(I),write(" "),NI is I+1,numSimbLast(T,El,NI),!.
numSimbLast([_|T],El,I):-NI is I+1,numSimbLast(T,El,NI),!.

% Exc 6
prExc6:-read_str(A,_),writeThird(A).

writeThird([]):-!.
writeThird([_,_,H3|T]):-name(NH3,[H3]),write(NH3),write(" "),writeThird(T).

% Exc 7
prExc7:-read_str(A,_),name(+,Pl),name(-,Mi),name(0,Ze),
	countSimb(A,0,NPl,Pl),countSimb(A,0,NMi,Mi),countSimb(A,0,NZe,Ze),
	Sum is NPl+NMi+NZe,write("Count = "),write(Sum).

countSimb([],N,N,_):-!.
countSimb([H|T],I,N,Simb):-(H=:=Simb -> NI is I+1,countSimb(T,NI,N,Simb));countSimb(T,I,N,Simb).
