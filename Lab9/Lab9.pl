in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

% Exc 1

build_all_razm_p:-
		read_str(A,_),read(K),b_a_rp(A,K,[]).

b_a_rp(_,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_rp(A,N,Perm):-in_list(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

build_all_perm:-
		read_str(A,_),b_a_p(A,[]).

b_a_p([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_p(A,Perm):-in_list_exlude(A,El,A1),b_a_p(A1,[El|Perm]).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

build_all_razm:-
		read_str(A,_,_),read(K),b_a_r(A,K,[]).

b_a_r(_,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_r(A,N,Perm):-in_list_exlude(A,El,Perm1),N1 is N-1,b_a_r(Perm1,N1,[El|Perm]).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):-sub_set(Sub_set,Set).
pr_subset:-read_str(A,_),sub_set(B,A),write_str(B),nl,fail.


sochet([],0,_):-!.
sochet([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet(Sub_set,K1,Set).
sochet(Sub_set,K,[_|Set]):-sochet(Sub_set,K,Set).
pr_sochet:-read_str(A,_),read(K),sochet(B,K,A),write_str(B),nl,fail.

sochet_p([],0,_):-!.
sochet_p([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet_p(Sub_set,K1,[H|Set]).
sochet_p(Sub_set,K,[_|Set]):-sochet_p(Sub_set,K,Set).
pr_sochet_p:-read_str(A,_),read(K),sochet_p(B,K,A),write_str(B),nl,fail.

% Exc 2

only2A:-tell('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab9/Out.txt'),
	o2a([a,b,c,d,e,f],5,[]),told.

o2a(_,0,Perm1):-count(a,Perm1,N),(N=:=2->write_str(Perm1),nl,!,fail;!,fail).
o2a(A,N,Perm):-in_list(A,El),N1 is N-1,o2a(A,N1,[El|Perm]).

count(_, [], 0):-!.
count(Elem, List, X):- count(Elem, List, 0, X).
count(_, [], Count, Count):- !.
count(Elem, [Elem|T], Count,X):- Count1 is Count + 1,count(Elem, T, Count1, X), !.
count(Elem, [_|T], Count, X):- count(Elem, T, Count, X).

% Exc 3

only2ANoPovt:-tell('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab9/Out.txt'),
	o2aNoPovt([a,b,c,d,e,f],5,[]),told.

o2aNoPovt(_,0,Perm):-countGroup3(Perm)->write_str(Perm),nl,!,fail;!,fail.
o2aNoPovt(A,N,Perm):-in_list(A,El),N1 is N-1,o2aNoPovt(A,N1,[El|Perm]).

countGroup3(Perm):-count(a,Perm,Na),Na is 2,
		count(b,Pern,Nb),(Nb is 1;Nb is 0),
		count(c,Pern,Nc),(Nc is 1;Nc is 1),
                count(d,Pern,Nd),(Nd is 1;Nd is 1),
                count(e,Pern,Ne),(Ne is 1;Ne is 1),
                count(f,Pern,Nf),(Nf is 1;Nf is 1).

% Exc 11
beznakazanno:-tell('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab9/Out.txt'),
	beznako([b,e,z,n,a,k,o],5,[]),told.

beznako(_,0,Perm1):-countGroup11(Perm1)->write_str(Perm1),nl,!,fail;!,fail.
beznako(A,N,Perm):-in_list(A,El),N1 is N-1,beznako(A,N1,[El|Perm]).

countGroup11(Perm):-count(b,Perm,Nb),Nb is 1,
		count(e,Perm,Ne),Ne is 1,
		count(z,Perm,Nz),Nz is 1,
		count(n,Perm,Nn),Nn is 1,
		count(a,Perm,Na),Na is 1.
