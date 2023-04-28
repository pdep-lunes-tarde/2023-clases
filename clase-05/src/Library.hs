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
entrenador = Entrenador 10 [pikachu, charmander, squirtle]

pikachu :: Pokemon
pikachu = Pokemon Electrico 0

otroPikachu :: Pokemon
otroPikachu = Pokemon Electrico 2500

charmander :: Pokemon
charmander = Pokemon Fuego 200

squirtle :: Pokemon
squirtle = Pokemon Agua 1000

-- 1)a)
esDeTipoElectrico :: Pokemon -> Bool
esDeTipoElectrico = esDeTipo Electrico

esDeTipoFuego :: Pokemon -> Bool
esDeTipoFuego = esDeTipo Fuego

esDeTipoAgua :: Pokemon -> Bool
esDeTipoAgua = esDeTipo Agua

--  b)
esFuerte pokemon = experiencia pokemon >= 1000

-- 2) a) 
losFuertes :: Entrenador -> [Pokemon]
losFuertes entrenador =
    filter esFuerte (pokemons entrenador)


-- b)
losDeTipo :: Tipo -> Entrenador -> [Pokemon]
losDeTipo unTipo entrenador =
    pokemonsDeTipo unTipo (pokemons entrenador)

esDeTipo :: Tipo -> Pokemon -> Bool
esDeTipo unTipo pokemon = 
    tipo pokemon == unTipo

pokemonsDeTipo :: Tipo -> [Pokemon] -> [Pokemon]
pokemonsDeTipo unTipo pokemones =
    filter (\pokemon -> esDeTipo unTipo pokemon) pokemones

-- pokemonsDeTipo unTipo [] = []
-- pokemonsDeTipo unTipo (pokemon:resto)
--     | coincidenTipos unTipo pokemon =
--         pokemon : pokemonsDeTipo unTipo resto
--     | otherwise = pokemonsDeTipo unTipo resto

-- pokemonQueCumplen
--     :: (Pokemon -> Bool) -> [Pokemon] -> [Pokemon]
-- pokemonQueCumplen condicion [] = []
-- pokemonQueCumplen condicion (pokemon:pokemons)
--     | condicion pokemon =
--         pokemon : pokemonQueCumplen condicion pokemons
--     | otherwise = pokemonQueCumplen condicion pokemons

-- 3)

entrenar :: Number -> Pokemon -> Pokemon
entrenar minutos pokemon = aumentarExperiencia (minutos * 2) pokemon

aumentarExperiencia :: Number -> Pokemon -> Pokemon
aumentarExperiencia cantidad (Pokemon tipo experiencia) = Pokemon tipo (experiencia + cantidad)

-- 4)

entrenarEquipo :: Number -> Entrenador -> Entrenador
entrenarEquipo minutos (Entrenador pokebolas pokemons) =
    Entrenador pokebolas (map (\pokemon -> entrenar minutos pokemon) pokemons)

-- 5)

puedeSerLiderDeGimnasio = implementame

tieneAlMenosUnoFuerte :: Entrenador -> Bool
tieneAlMenosUnoFuerte entrenador = any esFuerte (pokemons entrenador)

todosSonDelMismoTipo :: Entrenador -> Bool
todosSonDelMismoTipo entrenador =
    all (\pokemon -> tienenMismoTipo (primerPokemon entrenador) pokemon)
        (pokemons entrenador)

tienenMismoTipo :: Pokemon -> Pokemon -> Bool
tienenMismoTipo unPokemon otroPokemon = tipo unPokemon == tipo otroPokemon

primerPokemon :: Entrenador -> Pokemon
primerPokemon entrenador = head (pokemons entrenador)

-- 6)

atrapar :: Entrenador -> Pokemon -> Entrenador
atrapar entrenador pokemon
    | tienePokebolas entrenador = agregarAlEquipo entrenador pokemon
    | otherwise = entrenador

tienePokebolas :: Entrenador -> Bool
tienePokebolas (Entrenador pokebolas _) = pokebolas > 0

agregarAlEquipo :: Entrenador -> Pokemon -> Entrenador
agregarAlEquipo (Entrenador pokebolas pokemons) pokemon =
    Entrenador pokebolas (pokemon : pokemons)

-- 7)

atraparHorda :: Entrenador -> [Pokemon] -> Entrenador
atraparHorda entrenador pokemons = foldl atrapar entrenador pokemons
