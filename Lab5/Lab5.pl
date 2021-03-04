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
theProletarii:- Workers=[_,_,_],

	in_list(Workers,[slesar,_,0,0,_]),
	in_list(Workers,[tokar,_,_,1,_]),
	in_list(Workers,[svarschik,_,_,_,_]),
	in_list(Workers,[_,borisov,1,_,_]),
	in_list(Workers,[_,ivanov,_,_,_]),
	in_list(Workers,[_,semenov,_,2,borisov]),

write(Workers),!.

% Exc 5
theDrinks:- Drinks=[_,_,_,_],
    in_list(Drinks,[bottle,_]),
    in_list(Drinks,[glass,_]),
    in_list(Drinks,[jug,_]),
    in_list(Drinks,[jar,_]),
    in_list(Drinks,[_,milk]),
    in_list(Drinks,[_,lemonade]),
    in_list(Drinks,[_,kvass]),
    in_list(Drinks,[_,water]),

    not(in_list(Drinks,[bottle,water])),
    not(in_list(Drinks,[bottle,milk])),

    sprava_next([jug,_],[_,lemonade],Drinks),
    sprava_next([_,lemonade],[_,kvass],Drinks),

    not(in_list(Drinks,[jar,lemonade])),
    not(in_list(Drinks,[jar,water])),

    next_to([jar,_],[glass,_],Drinks),
    next_to([jar,_],[_,milk],Drinks),

write(Drinks),!.

% Exc 6
artists:- Artist=[_,_,_,_],
    in_list(Artist,[voronov,_]),
    in_list(Artist,[pavlov,_]),
    in_list(Artist,[levitsky,_]),
    in_list(Artist,[saharov,_]),
    in_list(Artist,[_,dancer]),
    in_list(Artist,[_,painter]),
    in_list(Artist,[_,singer]),
    in_list(Artist,[_,writer]),

    not(in_list(Artist,[voronov,singer])),
    not(in_list(Artist,[voronov,painter])),
    not(in_list(Artist,[pavlov,painter])),
    not(in_list(Artist,[pavlov,writer])),
    not(in_list(Artist,[saharov,writer])),
    not(in_list(Artist,[voronov,writer])),

write(Artist),!.

% Exc 7
malibuSafeguards:- Boys=[_,_,_],
    in_list(Boys,[michael,_,basketball,_]),
    in_list(Boys,[simon,israeli,_,_]),
    in_list(Boys,[richard,_,_,_]),
    in_list(Boys,[_,american,_,_]),
    in_list(Boys,[_,australian,_,_]),
    in_list(Boys,[_,_,tennis,_]),
    in_list(Boys,[_,_,cricket,first]),
    in_list(Boys,[_,_,_,second]),
    in_list(Boys,[_,_,_,third]),

    not(in_list(Boys,[michael,american,_,_])),
    not(in_list(Boys,[simon,_,tennis,_])),

    in_list(Boys,[Who1,australian,_,_]),
    in_list(Boys,[Who2,_,tennis,_]),

write(Boys),nl,
write("It`s mean "),nl,
write(Who1),write(" is australian"),nl,
write(Who2),write(" is like tennis"),!.
