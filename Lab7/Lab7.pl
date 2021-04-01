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
prExc1:-read_str_f(A,X,0),write_str(A),write(" , "),write_str(A),
	write(" , "),write_str(A),write(" , "),write(X).

% Exc 2
prExc2:-read_str(A,_),count_words(A,K),write(K).

count_words(A,K):-count_words(A,0,K).

count_words([],K,K):-!.
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
	I1 is I+1,count_words(A2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),get_word(T,W1,Word,A2).

% Exc 3
get_words(A,Words,K):-get_words(A,[],Words,0,K).

get_words([],B,B,K,K):-!.
get_words(A,Temp_words,B,I,K):-
	skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
	I1 is I+1,append(Temp_words,[Word],T_w),get_words(A2,T_w,B,I1,K),!.
get_words(_,B,B,K,K).

prExc3:-read_str(A,_),get_words(A,Words,_),unique_elems(Words,U_words),
		counts(U_words,C,Words),indOfMax(C,Ind),
		el_by_number(U_words,Ind,El),write_str(El).


counts([],[],_):-!.
counts([Word|T_words],[Count|T_counts],Words):-
	count(Word,Words,Count),counts(T_words,T_counts,Words).

el_by_number(A,Ind,El):-el_by_number(A,1,Ind,El).
el_by_number([],_,_,nil):-!.
el_by_number([El|_],Ind,Ind,El):-!.
el_by_number([_|T],I,Ind,El):-I1 is I+1,el_by_number(T,I1,Ind,El).

%1. Uniq_el(A,B) В элементы списка А без повторов
%2. count(El,List,Count) сколько раз El в списке
%3. номер мин имального элемента списка (нумерация с 1).

count(_, [], 0):-!.
count(Elem, List, X):- count(Elem, List, 0, X).
count(_, [], Count, Count):- !.
count(Elem, [Elem|T], Count,X):- Count1 is Count + 1,count(Elem, T, Count1, X), !.
count(Elem, [_|T], Count, X):- count(Elem, T, Count, X).

indOfMax(X,Y):-indexOfMin(X,Y).
indexOfMin([], -1):- !.
indexOfMin([H|T], X):-indexOfMin(T, 1, 1, X, H).
indexOfMin([], _, MinInd, MinInd, _):-!.
indexOfMin([H|T], CurInd, _, X, CurMin):-
	H > CurMin, NewCurInd is CurInd + 1,
	indexOfMin(T, NewCurInd, NewCurInd, X, H), !.
indexOfMin([_|T], CurInd, MinInd, X, CurMin):-
	NewCurInd is CurInd + 1, indexOfMin(T, NewCurInd, MinInd, X, CurMin).
% Exc 4
prExc4:-read_str(A,N),(N>5 -> write3(A),reverse(A,NA),write3(NA);writeFirst(A)).

write3([H1,H2,H3|_]):-name(NH1,[H1]),write(NH1),write(" "),
	name(NH2,[H2]),write(NH2),write(" "),name(NH3,[H3]),write(NH3),write(" ").

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
prExc7:-read_str(A,_),
		number_times(A,CountP,43),
		number_times(A,CountM,45),
                CountPM is CountP+CountM,
                string_next(A,48,CountN),

		nl,write("total quantity of '+' and '-': "),
		writeln(CountPM),

		write("number of characters followed by '0': "),
		writeln(CountN),nl.

number_times([],0,_):-!.
number_times([H|T],X,H):-number_times(T,CurX,H),X is CurX+1,!.
number_times([_|T],X,N):-number_times(T,X,N).

string_next([],_,0):-!.
string_next([_|[]],_,0):-!.
string_next([_,H2|T],H2,Count):-string_next([H2|T],H2,CurCount),
				Count is CurCount+1,!.
string_next([_|T],X,Count):-string_next(T,X,Count).

% Exc 8
prExc8:-read_str(A,_),whoFirst(A,120,119).

whoFirst([H|_],H,_):-!,write("Первый x").
whoFirst([H|_],_,H):-!,write("Первый w").
whoFirst([],_,_):-!,write("Такого нет").
whoFirst([_|T],X,W):-whoFirst(T,X,W).

% Exc 9
prExc9:-write("Строка 1 "),read_str(A,NA),write("Строка 2 "),
	read_str(B,NB),(NB > NA -> N is NB-NA, writeNTime(B,0,N);
		       N is NA-NB,writeNTime(A,0,N)).

writeNTime(_,N,N):-!.
writeNTime(List,I,N):-write_str(List),write(" "),NI is I+1,
	writeNTime(List,NI,N).

% Exc 10
prExc10:-read_str(A,_),excChanger(A,ChA),name(NormA,ChA),write(NormA).

excChanger([H1,H2,H3|T],Ch):-(H1 is 97,H2 is 98,H3 is 99->append([119,119,119],T,Ch);append([H1,H2,H3|T],[122,122,122],Ch)).

% Exc 11

prExc11:-read_str(A,N),(N>10->first6(A,NewA);addTo12(A,N,NewA)),
	name(Res,NewA),write(Res).

first6([H1,H2,H3,H4,H5,H6|_],[H1,H2,H3,H4,H5,H6]).

addTo12(Res,12,Res):-!.
addTo12(Str,N,Res):-N1 is N+1,append(Str,[111],Str1),
	addTo12(Str1,N1,Res).

% Exc 12

% Exc 13
prExc13:-read_str(L,_),replaceEven(L,ResL),write_str(ResL).

replaceEven([],L,L,_):-!.
replaceEven([H|T],CurL,ResL,I):-CurI is I+1,1 is CurI mod 2,
	append(CurL,[H],NewL),replaceEven(T,NewL,ResL,CurI),!.
replaceEven([H|T],CurL,ResL,I):-CurI is I+1,H \= 97,H \= 98,
	append(CurL,[97],NewL),replaceEven(T,NewL,ResL,CurI),!.
replaceEven([_|T],CurL,ResL,I):-CurI is I+1,append(CurL,[99],NewL),
	replaceEven(T,NewL,ResL,CurI).
replaceEven(L,ResL):-replaceEven(L,[],ResL,0).

% Exc 14
prExc14:-read_str(A,_),countNumb(A,0,N),write("Count = "),write(N).

countNumb([],N,N):-!.
countNumb([H|T],CurN,N):-(H>= 48,H=<57->NewN is CurN+1;
		     NewN is CurN),countNumb(T,NewN,N).

% Exc 15
prExc15:-read_str(A,_),abc(A).

abc([]):-!.
abc([H|_]):-H=\=97,H=\=98,H\=99,!,fail.
abc([_|T]):-abc(T).

% Exc 16
prExc16:-read_str(A,_),wordChanger(A,[],Res),name(NewA,Res),write(NewA).

wordChanger([H2,H3,H4],I,Res):-append(I,[H2,H3,H4],Res),!.
wordChanger([],Res,Res):-!.
wordChanger([H1,H2,H3,H4|T],I,Res):-wordCheck(H1,H2,H3,H4)->append(I,[108,101,116,116,101,114],I1),wordChanger(T,I1,Res);append(I,[H1],I1),wordChanger([H2,H3,H4|T],I1,Res).

wordCheck(H1,H2,H3,H4):-H1 =:= 119,H2 =:= 111,H3 =:= 114,H4 =:= 100.

% Exc 17
%prExc17:-read_str(A,_),delXABC(A,[],Res),name(NewA,Res),write(NewA).

%delXABC([H2,H3,H4],I,Res):-append(I,[H2,H3,H4],Res),!.
%delXABC([],Res,Res):-!.
% delXABC([H1,H2,H3,H4|T],I,Res):-xABCCheck(H1,H2,H3,H4)->append(I,[97,98,99],I1)
%	delXABC(T,I1,Res);append(I,[H1],I1),delXABC([H2,H3,H4|T],I1,Res).

%xABCCheck(H1,H2,H3,H4):-H1 =:= 120,H2 =:= 97,H3 =:= 98,H4 =:= 99.

% Exc 18
prExc18:-read_str(A,_),abcDigit(A,[],Res),name(NewA,Res),write(NewA).

abcDigit([H2,H3,H4],I,Res):-append(I,[H2,H3,H4],Res),!.
abcDigit([],Res,Res):-!.
abcDigit([H1,H2,H3,H4|T],I,Res):-abcDigitCheck(H1,H2,H3,H4)->append(I,[H4],I1),
	abcDigit(T,I1,Res);append(I,[H1],I1),abcDigit([H2,H3,H4|T],I1,Res).

abcDigitCheck(H1,H2,H3,H4):-H1 =:= 97,H2 =:= 98,H3 =:= 99,H4>=48,H4=<57.
