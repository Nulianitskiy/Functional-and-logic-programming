man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

allMan(X):-man(X),write(X),write(", "),fail.
allWoman(X):-woman(X),write(X),write(", "),fail.

children(X,Y):-parent(Y,X).
allChildren(X):-children(Y,X),write(Y),write(", "),fail.

mother(X,Y):-parent(X,Y),woman(X).
mother(X):-mother(Y,X),write(Y).

father(X,Y):-parent(X,Y),man(X).
father(X):-father(Y,X),write(Y).

brother(X,Y):-parent(Z,X),parent(Z,Y),man(X),woman(Z).
brother(X):-brother(Y,X),write(Y),write(", "),fail.

wife(X,Y):-children(Z,X),children(Z,Y),woman(X).
wife(X):-wife(Y,X),write(Y).

b_s(X,Y):-parent(Z,X),parent(Z,Y),woman(Z).
b_s(X):-b_s(Y,X),write(Y),write(", "),fail.
