module Library where
import PdePreludat

---------------------
------ Parte 0 ------
---------------------

-- Vamos a modelar una parte del juego Uno.
-- Queremos tener una función que nos diga si una carta puede jugarse después de otra.
-- Por ahora, vamos a arrancar implementando solo las cartas con números.

-- type Carta = (String, Number)

-- Defino un tipo Carta, y una Carta se 
-- construye haciendo:
-- UnaCarta unString unNumber
-- Ej:
-- UnaCarta "Rojo" 3
data Carta = UnaCarta String Number

sePuedeJugar :: Carta -> Carta -> Bool
sePuedeJugar cartaInicial cartaAJugar = tienenMismoNumero cartaInicial cartaAJugar || tienenMismoColor cartaInicial cartaAJugar

tienenMismoNumero :: Carta -> Carta -> Bool
tienenMismoNumero (UnaCarta _ numero) (UnaCarta _ otroNumero) = numero == otroNumero

tienenMismoColor :: Carta -> Carta -> Bool
tienenMismoColor (UnaCarta color _) (UnaCarta otroColor _) = color == otroColor
-- tienenMismoColor unaCarta otraCarta =
--     color unaCarta == color otraCarta

-- color :: Carta -> String
-- color (unColor, _) = unColor
color :: Carta -> String
color (UnaCarta unColor _) = unColor 

-- numero :: Carta -> Number
-- numero (_, unNumero) = unNumero
numero :: Carta -> Number
numero (UnaCarta _ unNumero) = unNumero



---------------------
------ Parte 1 ------
---------------------


-- Hay jugadores, que tienen un nombre y una cantidad de puntos que obtuvieron
-- por sus resultados en partidas de uno.
-- Queremos poder pedirle su nombre y también sus puntos.
type Jugador = (String, Number)

juan :: Jugador
juan = ("Juan", 10)

nombre :: Jugador -> String
nombre (unNombre, _) = unNombre
-- Ejemplo:
-- nombre juan
-- > "Juan"

puntos :: Jugador -> Number
puntos (_, unosPuntos) = unosPuntos
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
