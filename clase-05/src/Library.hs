module Library where
import PdePreludat

data Entrenador = Entrenador { 
    cantidadPokebolas :: Number, 
    pokemons :: [Pokemon] 
    } deriving(Eq, Show)

data Tipo = Electrico | Fuego | Agua deriving(Eq, Show)

data Pokemon = Pokemon {
    tipo :: Tipo, 
    experiencia :: Number 
    } deriving(Eq, Show)

entrenador :: Entrenador
entrenador = Entrenador 10 [pikachu, charmander]

pikachu :: Pokemon
pikachu = Pokemon Electrico 0

otroPikachu :: Pokemon
otroPikachu = Pokemon Electrico 2500

charmander :: Pokemon
charmander = Pokemon Fuego 200

squirtle :: Pokemon
squirtle = Pokemon Agua 1000

-- 1)a)
esDeTipoElectrico = implementame
esDeTipoFuego = implementame
esDeTipoAgua = implementame

--  b)
esFuerte = implementame

-- 2) a) 
losFuertes = implementame

-- b)
losDeTipo = implementame


-- 3)

entrenar = implementame

-- 4)

entrenarEquipo = implementame

-- 5)

puedeSerLiderDeGimnasio = implementame

-- 6)

atrapar = implementame

-- 7)

atraparHorda = implementame
