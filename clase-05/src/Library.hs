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

esFuerte :: Pokemon -> Bool
esFuerte pokemon = experiencia pokemon > 1000

losFuertes :: [Pokemon] -> [Pokemon]
losFuertes pokemons = filter esFuerte pokemons

esDeTipo :: Tipo -> Pokemon -> Bool 
esDeTipo unTipo pokemon = tipo pokemon == unTipo

losDeTipo :: Tipo -> [Pokemon] -> [Pokemon]
losDeTipo unTipo pokemons = filter (\pokemon -> esDeTipo unTipo pokemon) pokemons

filtrar :: (a -> Bool) -> [a] -> [a]
filtrar _ [] = []
filtrar condicion (x : xs)
     | condicion x = x : filtrar condicion xs
     | otherwise = filtrar condicion xs

aumentarExperiencia :: Number -> Pokemon -> Pokemon
aumentarExperiencia cantidad pokemon = pokemon { experiencia = experiencia pokemon + cantidad }
-- es lo mismo que:
-- aumentarExperiencia cantidad (Pokemon tipo experiencia) = Pokemon tipo (experiencia + cantidad)

pikachu :: Pokemon
pikachu = Pokemon Electrico 0

otroPikachu :: Pokemon
otroPikachu = Pokemon Electrico 2500

charmander :: Pokemon
charmander = Pokemon Fuego 200

squirtle :: Pokemon
squirtle = Pokemon Agua 1000

entrenador :: Entrenador
entrenador = Entrenador 10 [pikachu, charmander]
-------------------------------------

-- 2

-- atrapar (Entrenador cantidadPokebolas pokemons) pokemon
--     | cantidadPokebolas > 0 = Entrenador (cantidadPokebolas - 1) (pokemons ++ [pokemon])
--     | otherwise = Entrenador cantidadPokebolas pokemons

tienePokebolas :: Entrenador -> Bool
tienePokebolas (Entrenador cantidadPokebolas _) = cantidadPokebolas > 0

gastarUnaPokebola :: Entrenador -> Entrenador
gastarUnaPokebola (Entrenador cantidadPokebolas pokemons) =
    Entrenador (cantidadPokebolas - 1) pokemons
-- gastarUnaPokebola entrenador = entrenador {
--  cantidadPokebolas = cantidadPokebolas entrenador - 1
-- }

sumarAlEquipo :: Pokemon -> Entrenador -> Entrenador
sumarAlEquipo pokemon (Entrenador cantidadPokebolas pokemons) =
    Entrenador cantidadPokebolas (pokemons ++ [pokemon])
-- sumarAlEquipo pokemon entrenador = entrenador {
--     pokemons = pokemons entrenador ++ [pokemon]
-- }


entrenar :: Number -> Pokemon -> Pokemon
entrenar minutos pokemon = aumentarExperiencia (minutos * 2) pokemon

entrenarEquipo :: Entrenador -> Number -> Entrenador
entrenarEquipo (Entrenador cantidadPokebolas pokemons) minutos =
    Entrenador cantidadPokebolas (entrenarPokemons minutos pokemons)

entrenarPokemons :: Number -> [Pokemon] -> [Pokemon]
-- entrenarPokemons _ [] = []
-- entrenarPokemons minutos (pokemon : pokemons) =
--     (entrenar minutos pokemon : entrenarPokemons minutos pokemons)
entrenarPokemons minutos pokemons =
    aplicarATodos (\pokemon -> entrenar minutos pokemon) pokemons

tipos :: [Pokemon] -> [Tipo]
tipos [] = []
tipos (pokemon : pokemons) = (tipo pokemon : tipos pokemons)

tipos pokemons = aplicarATodos tipo pokemons

aplicarATodos :: (Pokemon -> a) -> [Pokemon] -> [a]
aplicarATodos funcion [] = []
aplicarATodos funcion (pokemon : pokemons) =
    (funcion pokemon : aplicarATodos funcion pokemons)
-- f funcion [a, b, c, d]
-- [funcion a, funcion b, funcion c, funcion d]        
-- [a        , b        , c        , d]

-- map :: (a -> b) -> [a] -> [b]

atrapar :: Entrenador -> Pokemon -> Entrenador
atrapar entrenador pokemon
    | tienePokebolas entrenador = sumarAlEquipo pokemon (gastarUnaPokebola entrenador)
    | otherwise = entrenador

-- atraparHorda :: Entrenador -> [Pokemon] -> Entrenador
atraparHorda :: Entrenador -> [Pokemon] -> Entrenador
atraparHorda entrenador [] = entrenador
atraparHorda entrenador (pokemon : pokemons) =
    atraparHorda (atrapar entrenador pokemon) pokemons
-- atraparHorda entrenador [pikachu, charmander, squirtle]
-- atraparHorda (atrapar entrenador pikachu) [charmander, squirtle]
-- atraparHorda (atrapar (atrapar entrenador pikachu) charmander) [squirtle]
-- atraparHorda (atrapar (atrapar (atrapar entrenador pikachu) charmander) squirtle) []
-- (atrapar (atrapar (atrapar entrenador pikachu) charmander) squirtle)

-- foldl :: (a -> b -> a) -> a -> [b] -> a

atraparHorda entrenador pokemons = foldl atrapar entrenador pokemons

sumatoria :: [Number] -> Number
sumatoria numeros = foldl (+) 0 numeros

-- foldl atrapar entrenador [pikachu, squirtle]
-- entrenador `atrapar` pikachu `atrapar` squirtle
-- (atrapar (atrapar entrenador  pikachu) squirtle

-- sumatoria [1, 2, 3, 4]
-- 0 + 1 + 2 + 3 + 4
-- 12

-- (+) 1 2
-- 3

concatenar :: [a] -> [a] -> [a]
concatenar unaLista otraLista =
    foldl (\listaAcumulada elemento -> listaAcumulada ++ [elemento])
            unaLista
            otraLista

puedeSerLiderDeGimnasio :: Entrenador -> Bool
puedeSerLiderDeGimnasio entrenador =
    tieneAlMenosUnoFuerte entrenador &&
    todosSonDelMismoTipo entrenador &&
    tieneMasDe6 entrenador

tieneAlMenosUnoFuerte :: Entrenador -> Bool
tieneAlMenosUnoFuerte entrenador = any esFuerte (pokemons entrenador)

todosSonDelMismoTipo :: Entrenador -> Bool
todosSonDelMismoTipo entrenador =
    all (\pokemon -> esDeTipo (tipoDelPrimerPokemonDe entrenador) pokemon) (pokemons entrenador)

tipoDelPrimerPokemonDe :: Entrenador -> Tipo
tipoDelPrimerPokemonDe entrenador = tipo (head (pokemons entrenador))

tieneMasDe6 :: Entrenador -> Bool 
tieneMasDe6 entrenador = length (pokemons entrenador) > 6


-- foldl (left) y foldr (right)
-- foldl :: (b -> a -> b) -> b -> [a] -> b
-- foldl (+) 0 [1,2,3]
-- ((0 + 1) + 2) + 3

-- foldl (-) 0 [1,2,3]
-- ((0 - 1) - 2) - 3


-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- foldr (+) 0 [1,2,3]
-- 1 + (2 + (3 + 0))

-- foldr (-) 0 [1,2,3]
-- 1 - (2 - (3 - 0))

-- foldl1 y foldr1
-- foldl1 :: (a -> a -> a) -> [a] -> a
-- foldr1 :: (a -> a -> a) -> [a] -> a
