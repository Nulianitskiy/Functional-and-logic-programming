man(kikela).
man(antimen).
man(bidziil).
man(gad).
man(melkeduduk).
man(nosh).
man(tekamseh).
man(honon).
man(yas).

man(saik).

woman(adsila).
woman(ayasha).
woman(muna).
woman(koko).
woman(mimiteh).
woman(pokehontas).
woman(sokenon).
woman(uta).
woman(tiva).

woman(dakota).

parent(saik,ayasha).
parent(saik,muna).
parent(saik,antimen).
parent(saik,bidziil).

parent(dakota,ayasha).
parent(dakota,muna).
parent(dakota,antimen).
parent(dakota,bidziil).

parent(nosh,kikela).
parent(nosh,gad).
parent(nosh,uta).
parent(nosh,tiva).

parent(pokehontas,kikela).
parent(pokehontas,gad).
parent(pokehontas,uta).
parent(pokehontas,tiva).

parent(kikela,honon).
parent(kikela,tekamseh).
parent(ayasha,honon).
parent(ayasha,tekamseh).

parent(gad,sokenon).
parent(gad,yas).
parent(muna,sokenon).
parent(muna,yas).

parent(uta,koko).
parent(uta,adsila).
parent(antimen,koko).
parent(antimen,adsila).

parent(tiva,melkeduduk).
parent(tiva,sokenon).
parent(bidziil,melkeduduk).
parent(bidziil,sokenon).

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

grand_pa(X,Y):-parent(X,Z),parent(Z,Y),man(X).
grand_pas(X):-grand_pa(Y,X),write(Y),write(", "),fail.

grand_da(X,Y):-parent(Y,Z),parent(Z,X),woman(X).
grand_das(X):-grand_da(Y,X),write(Y),write(", "),fail.

grand_pa_and_son(X,Y):-grand_pa(X,Y)\=grand_pa(Y,X),man(X),man(Y).

grand_ma_and_son(X,Y):-parent(X,Z),parent(Z,Y),woman(X),man(Y).

uncle(X,Y):-parent(Z,H),parent(H,Y),parent(Z,X),X\=H,man(X),man(Z).
uncle(X):-uncle(Y,X),write(Y),write(", "),fail.
