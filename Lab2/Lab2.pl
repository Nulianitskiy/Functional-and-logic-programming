ruler(putin,1).
ruler(navalny,0).
ruler(medvedev,1).
ruler(yeltsin,1).
ruler(jirinovsky,0).
ruler(zuganov,0).
ruler(stalin,1).
ruler(nikolai_II,1).
ruler(peter_I,1).
ruler(catherine_II,1).
ruler(molotov,0).
ruler(saharov,0).
ruler(tramp,1).
ruler(biden,1).
ruler(obama,1).
ruler(kennedy,1).
ruler(klinton_H,0).
ruler(pelli,0).
ruler(eisenhower,1).
ruler(guver,1).
ruler(king_ML,0).
ruler(sanders,0).
ruler(hitler,1).
ruler(chaushescu,1).
ruler(milosevic,1).
ruler(zedong_M,1).
ruler(jinping_Xi,1).
ruler(jong-un,1).
ruler(pinochet,1).
ruler(merkel,1).
ruler(cherchell,1).
ruler(musolini,1).
ruler(newton,0).
ruler(talleyrand,0).

from(putin,0).
from(navalny,0).
from(medvedev,0).
from(yeltsin,0).
from(jirinovsky,0).
from(zuganov,0).
from(stalin,0).
from(nikolai_II,0).
from(peter_I,0).
from(catherine_II,0).
from(molotov,0).
from(saharov,0).
from(tramp,1).
from(biden,1).
from(obama,1).
from(kennedy,1).
from(klinton_H,1).
from(pelli,1).
from(eisenhower,1).
from(guver,1).
from(king_ML,1).
from(sanders,1).
from(hitler,2).
from(chaushescu,2).
from(milosevic,2).
from(zedong_M,2).
from(jinping_Xi,2).
from(jong-un,2).
from(pinochet,2).
from(merkel,2).
from(cherchell,2).
from(musolini,2).
from(newton,2).
from(talleyrand,2).

ideology(putin,1).
ideology(navalny,2).
ideology(medvedev,2).
ideology(yeltsin,2).
ideology(jirinovsky,2).
ideology(zuganov,0).
ideology(stalin,0).
ideology(nikolai_II,1).
ideology(peter_I,2).
ideology(catherine_II,2).
ideology(molotov,0).
ideology(saharov,2).
ideology(tramp,2).
ideology(biden,0).
ideology(obama,1).
ideology(kennedy,2).
ideology(klinton_H,2).
ideology(pelli,2).
ideology(eisenhower,1).
ideology(guver,0).
ideology(king_ML,0).
ideology(sanders,0).
ideology(hitler,2).
ideology(chaushescu,0).
ideology(milosevic,1).
ideology(zedong_M,0).
ideology(jinping_Xi,0).
ideology(jong-un,0).
ideology(pinochet,2).
ideology(merkel,1).
ideology(cherchell,1).
ideology(musolini,2).
ideology(newton,1).
ideology(talleyrand,1).

life(putin,1).
life(navalny,1).
life(medvedev,1).
life(yeltsin,0).
life(jirinovsky,1).
life(zuganov,1).
life(stalin,0).
life(nikolai_II,0).
life(peter_I,0).
life(catherine_II,0).
life(molotov,0).
life(saharov,0).
life(tramp,1).
life(biden,1).
life(obama,1).
life(kennedy,0).
life(klinton_H,1).
life(pelli,0).
life(eisenhower,0).
life(guver,0).
life(king_ML,0).
life(sanders,1).
life(hitler,0).
life(chaushescu,0).
life(milosevic,0).
life(zedong_M,0).
life(jinping_Xi,1).
life(jong-un,1).
life(pinochet,0).
life(merkel,1).
life(cherchell,0).
life(musolini,0).
life(newton,0).
life(talleyrand,0).

opinion(putin,1).
opinion(navalny,1).
opinion(medvedev,2).
opinion(yeltsin,1).
opinion(jirinovsky,2).
opinion(zuganov,2).
opinion(stalin,1).
opinion(nikolai_II,2).
opinion(peter_I,0).
opinion(catherine_II,1).
opinion(molotov,0).
opinion(saharov,0).
opinion(tramp,1).
opinion(biden,1).
opinion(obama,0).
opinion(kennedy,0).
opinion(klinton_H,2).
opinion(pelli,2).
opinion(eisenhower,0).
opinion(guver,1).
opinion(king_ML,0).
opinion(sanders,2).
opinion(hitler,2).
opinion(chaushescu,2).
opinion(milosevic,2).
opinion(zedong_M,1).
opinion(jinping_Xi,1).
opinion(jong-un,2).
opinion(pinochet,1).
opinion(merkel,0).
opinion(cherchell,0).
opinion(musolini,1).
opinion(newton,0).
opinion(talleyrand,1).

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

     ruler(X,X1),
     from(X,X2),
     ideology(X,X3),
     life(X,X4),
     opinion(X,X5),
     write("И ваш покемон: " , X),nl,fail.
