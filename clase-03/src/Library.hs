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
-- CartaNumerica unString unNumber
-- Ej:
-- CartaNumerica "Rojo" 3
data Carta = CartaNumerica Color Number
            | Mas4 Color
    deriving (Eq, Show)

-- Defino un tipo Color, y un Color se
-- construye haciendo:
-- Rojo, o Azul, o Verde, o Amarillo
-- Ej:
-- Rojo
data Color = Rojo | Azul | Verde | Amarillo
    deriving (Eq, Show)

sePuedeJugar :: Carta -> Carta -> Bool
sePuedeJugar _ (Mas4 _) = True
sePuedeJugar (Mas4 color) otraCarta =
    tienenMismoColor (Mas4 color) otraCarta
sePuedeJugar cartaInicial cartaAJugar = tienenMismoNumero cartaInicial cartaAJugar || tienenMismoColor cartaInicial cartaAJugar

tienenMismoNumero :: Carta -> Carta -> Bool
tienenMismoNumero (CartaNumerica _ numero) (CartaNumerica _ otroNumero) = numero == otroNumero

tienenMismoColor :: Carta -> Carta -> Bool
tienenMismoColor unaCarta otraCarta =
    color unaCarta == color otraCarta
-- tienenMismoColor CartaNumerica otraCarta =
--     color CartaNumerica == color otraCarta

-- color :: Carta -> String
-- color (unColor, _) = unColor
color :: Carta -> Color
color (CartaNumerica unColor _) = unColor
color (Mas4 unColor) = unColor 

-- numero :: Carta -> Number
-- numero (_, unNumero) = unNumero
numero :: Carta -> Number
numero (CartaNumerica _ unNumero) = unNumero



---------------------
------ Parte 1 ------
---------------------


-- Hay jugadores, que tienen un nombre y una cantidad de puntos que obtuvieron
-- por sus resultados en partidas de uno.
-- Queremos poder pedirle su nombre y también sus puntos.
-- type Jugador = (String, Number)
data Jugador = UnJugador String Number
    deriving (Eq, Show)

juan :: Jugador
-- juan = ("Juan", 10)
juan = UnJugador "Juan" 10

nombre :: Jugador -> String
-- nombre (unNombre, _) = unNombre
nombre (UnJugador unNombre _) = unNombre
-- Ejemplo:
-- nombre juan
-- > "Juan"

puntos :: Jugador -> Number
puntos (UnJugador _ unosPuntos) = unosPuntos
-- Ejemplo:
-- puntos juan
-- > 10

---------------------
------ Parte 2 ------
---------------------
-- Puesta en comun 4:40

-- Queremos saber entre dos jugadores, quien tiene mas puntos.
-- Si ambos tienen la misma cantidad de puntos, me da el primero que le pasé.
-- Nota: esto tiene que devolver un jugador.
juani = UnJugador "Juani" 15

quienTieneMasPuntos :: Jugador -> Jugador -> Jugador
quienTieneMasPuntos unJugador otroJugador
    | puntos unJugador >= puntos otroJugador = unJugador
    | otherwise = otroJugador

-- Queremos registrarle a un jugador el resultado de una partida:
-- si el resultado es que ganó, suma 3 puntos
-- si el resultado es que empató, suma 1 punto
-- si el resultado es que perdió, suma 0 puntos
data Resultado = Gano | Perdio | Empato
    deriving (Eq, Show)

sumaPuntaje :: Number -> Jugador -> Jugador
sumaPuntaje unPuntaje (UnJugador nombre puntaje) = UnJugador nombre (puntaje + unPuntaje) 

trasJugarPartida :: Jugador -> Resultado -> Jugador
-- trasJugarPartida jugador resultado
--     | resultado == Gano = sumaPuntaje 3 jugador
--     | resultado == Empato = sumaPuntaje 1 jugador
--     | resultado == Perdio = jugador
-- trasJugarPartida jugador Gano = sumaPuntaje 3 jugador
-- trasJugarPartida jugador Empato = sumaPuntaje 1 jugador
-- trasJugarPartida jugador Perdio = sumaPuntaje 0 jugador
trasJugarPartida jugador resultado =
    sumaPuntaje (puntosQueDa resultado) jugador

puntosQueDa :: Resultado -> Number
puntosQueDa Gano = 3
puntosQueDa Empato = 1
puntosQueDa Perdio = 0


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
