% Exc 1
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

sprava_next(A,B,[C]):-fail.
sprava_next(A,B,[A|[B|Tail]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(A,B,[C]):-fail.
sleva_next(A,B,[B|[A|Tail]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),
		nl,write(WHO1),nl,write(WHO2).

% Exc 2

prHairParty:- Friends=[_,_,_],
    in_list(Friends,[belokurov,_]),
    in_list(Friends,[chernov,_]),
    in_list(Friends,[rizhov,_]),
    in_list(Friends,[_,ginger]),
    in_list(Friends,[_,blond]),
    in_list(Friends,[_,brunette]),

    not(in_list(Friends,[belokurov,blond])),
    not(in_list(Friends,[chernov,brunette])),
    not(in_list(Friends,[rizhov,ginger])),
    not(in_list(Friends,[belokurov,brunette])),

write(Friends),!.

% Exc 3

prGirlsLook:- Girls=[_,_,_],
    in_list(Girls,[_,white,_]),
    in_list(Girls,[_,green,_]),
    in_list(Girls,[_,blue,_]),
    in_list(Girls,[_,_,white]),
    in_list(Girls,[_,_,green]),
    in_list(Girls,[_,_,blue]),
    in_list(Girls,[ann,_,_]),
    in_list(Girls,[natasha,_,green]),
    in_list(Girls,[valya,_,_]),

    not(in_list(Girls,[natasha,green,_])),
    not(in_list(Girls,[valya,white,white])),

write(Girls),!.

% Exc 4
prWorkers:- Workers=[_,_,_,_,_],
    in_list(Workers,[_,slesar,_]),
    in_list(Workers,[_,slesar,yong]),
    in_list(Workers,[seminov,_,old]),
    in_list(Workers,[borisov,_,midl]),
    not(in_list(Workers,[_,tokar,old])),
    in_list(Workers,[ivanov,_,_]),
    in_list(Workers,[_,svarshik,_]),
    in_list(Workers,[W1,slesar,_]),
    in_list(Workers,[W2,tokar,_]),
    in_list(Workers,[W3,svarshik,_]),

    write("Slesar is "),write(W1),nl,
    write("Tokar is "),write(W2),nl,
    write("Svarshik is "),write(W3),nl.
