module Library where
import PdePreludat

---------------------
------ Parte 0 ------
---------------------

-- Vamos a modelar una parte del juego Uno.
-- Queremos tener una función que nos diga si una carta puede jugarse después de otra.
-- Por ahora, vamos a arrancar implementando solo las cartas con números.

sePuedeJugar = implementame

---------------------
------ Parte 1 ------
---------------------


-- Hay jugadores, que tienen un nombre y una cantidad de puntos que obtuvieron
-- por sus resultados en partidas de uno.
-- Queremos poder pedirle su nombre y también sus puntos.
juan = implementame

nombre jugador = implementame
-- Ejemplo:
-- nombre juan
-- > "Juan"

puntos jugador = implementame
-- Ejemplo:
-- puntos juan
-- > 10

---------------------
------ Parte 2 ------
---------------------

-- Queremos saber entre dos jugadores, quien tiene mas puntos.
-- Si ambos tienen la misma cantidad de puntos, me da el primero que le pasé.
-- Nota: esto tiene que devolver un jugador.
juani = implementame

quienTieneMasPuntos unJugador otroJugador = implementame

-- Queremos registrarle a un jugador el resultado de una partida:
-- si el resultado es que ganó, suma 3 puntos
-- si el resultado es que empató, suma 1 punto
-- si el resultado es que perdió, suma 0 puntos

trasJugarPartida jugador resultado = jugador

---------------------
------ Parte 3 ------
---------------------

-- Queremos agregar la carta de Mas4.
-- Esta carta tiene un color, que es el color que va a tener que usar el siguiente jugador,
-- pero no tiene número. Además, se puede jugar encima de cualquier otra carta.
-- Modifiquen la implementación de `sePuedeJugarDespuesDe` para poder usar cartas de Mas4.

-- BONUS: Queremos agregar las cartas de Reversa y SaltarTurno.
-- Estas cartas se pueden jugar sobre una que tenga el mismo simbolo o
-- sobre una que tenga el mismo color.

---------------------
------ Parte 4 ------
---------------------

-- Queremos saber si una carta es igual a otra.

-- Queremos saber si un jugador es menor o igual a otro,
-- esto se cumple si tiene menor o igual cantidad de puntos.
