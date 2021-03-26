:- dynamic ruler/2.
:- dynamic from/2.
:- dynamic ideology/2.
:- dynamic life/2.
:- dynamic opinion/2.

read_str(A):-get0(X),r_str(X,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).

% Ruler
ruler_r(X,Y):-repeat,(ruler(X,Y)->(nl,write(X),nl,write(Y),write("."),
                      retract(ruler(X,Y))) ;X=nil,Y=nil).

prRulerTell:-tell('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab11/ruler.txt'),ruler_r(X,_),X=nil,told.

prRulerSee:-see('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab11/ruler.txt'),get0(Sym),readRuler(Sym),seen.

readRuler(-1):-!.
readRuler(_):-read_str(Lang),name(X,Lang),read(Y),asserta(ruler(X,Y)),
                get0(Sym),readRuler(Sym).

% From
from_r(X,Y):-repeat,(from(X,Y)->(nl,write(X),nl,write(Y),write("."),
                      retract(from(X,Y))) ;X=nil,Y=nil).

prFromTell:-tell('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab11/from.txt'),from_r(X,_),X=nil,told.

prFromSee:-see('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab11/from.txt'),get0(Sym),readFrom(Sym),seen.

readFrom(-1):-!.
readFrom(_):-read_str(Lang),name(X,Lang),read(Y),asserta(from(X,Y)),
                get0(Sym),readFrom(Sym).

% Ideology
ideology_r(X,Y):-repeat,(ideology(X,Y)->(nl,write(X),nl,write(Y),write("."),
                      retract(ideology(X,Y))) ;X=nil,Y=nil).

prIdeologyTell:-tell('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab11/ideology.txt'),ideology_r(X,_),X=nil,told.

prIdeologySee:-see('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab11/ideology.txt'),get0(Sym),readIdeology(Sym),seen.

readIdeology(-1):-!.
readIdeology(_):-read_str(Lang),name(X,Lang),read(Y),asserta(ideology(X,Y)),
                get0(Sym),readIdeology(Sym).

% Life
life_r(X,Y):-repeat,(life(X,Y)->(nl,write(X),nl,write(Y),write("."),
                      retract(life(X,Y))) ;X=nil,Y=nil).

prLifeTell:-tell('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab11/life.txt'),life_r(X,_),X=nil,told.

prLifeSee:-see('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab11/life.txt'),get0(Sym),readLife(Sym),seen.

readLife(-1):-!.
readLife(_):-read_str(Lang),name(X,Lang),read(Y),asserta(life(X,Y)),
                get0(Sym),readLife(Sym).

% Opinion
opinion_r(X,Y):-repeat,(opinion(X,Y)->(nl,write(X),nl,write(Y),write("."),
                      retract(opinion(X,Y))) ;X=nil,Y=nil).

prOpinionTell:-tell('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab11/opinion.txt'),opinion_r(X,_),X=nil,told.

prOpinionSee:-see('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab11/opinion.txt'),get0(Sym),readOpinion(Sym),seen.

readOpinion(-1):-!.
readOpinion(_):-read_str(Lang),name(X,Lang),read(Y),asserta(opinion(X,Y)),
                get0(Sym),readOpinion(Sym).


% Easy life

prSeeAll:-prRulerSee,prFromSee,prIdeologySee,prLifeSee,prOpinionSee.
prTellAll:-prRulerTell,prFromTell,prIdeologyTell,prLifeTell,prOpinionTell.



question1(X1):-write("Он правит/правил страной?"),nl,
              write("0 - Нет"),nl,
              write("1 - Да"),nl,
              read(X1).

question2(X2):-write("Откуда этот человек?"),nl,
              write("0 - Россия"),nl,
              write("1 - Америка"),nl,
              write("2 - Другое"),nl,
              read(X2).

question3(X3):-write("Его политический спектр?"),nl,
              write("0 - Левый"),nl,
              write("1 - Центрист"),nl,
              write("2 - Правый"),nl,
              read(X3).

question4(X4):-write("Он ещё жив?"),nl,
              write("0 - Нет"),nl,
              write("1 - Да"),nl,
              read(X4).

question5(X5):-write("Как к нему относятся люди?"),nl,
              write("0 - Хорошо"),nl,
              write("1 - Спорно"),nl,
              write("2 - Плохо"),nl,
              read(X5).

pr:- question1(X1),
     question2(X2),
     question3(X3),
     question4(X4),
     question5(X5),

     (ruler(X,X1),
     from(X,X2),
     ideology(X,X3),
     life(X,X4),
     opinion(X,X5),
     write("И ваш покемон: "),writeln(X);newOne(X1,X2,X3,X4,X5)),fail.

newOne(X1,X2,X3,X4,X5):-writeln("Я хз, это новенький?"),
    writeln("1 - Да"),writeln("0 - Нет"),read(Ans),
    (Ans is 1 ->writeln("Ок, введи тогда имя"),read(Name),
     addNewOne(X1,X2,X3,X4,X5,Name);writeln("Ну ок"),fail).

addNewOne(X1,X2,X3,X4,X5,Name):-
    append('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab11/ruler.txt'),
    nl, write(Name), nl,write(X1),write("."), told,

    append('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab11/from.txt'),
    nl, write(Name), nl,write(X2),write("."), told,

    append('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab11/ideology.txt'),
    nl, write(Name), nl,write(X3),write("."), told,

    append('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab11/life.txt'),
    nl, write(Name), nl,write(X4),write("."), told,

    append('C:/Users/User/Desktop/Resources/2 Course/Funkcionalnoe_i_logicheskoe_prevozmoganie/Lab11/opinion.txt'),
    nl, write(Name), nl,write(X5),write("."), told.
