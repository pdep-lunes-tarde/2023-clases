{-# LANGUAGE BangPatterns #-}
module Library where
import PdePreludat

constLazy :: a -> b -> a
constLazy x y = x

-- constLazy (trace "evaluo 5" 5)
--           (trace "evaluo 10" 10)
-- -- es equivalente a:
-- (trace "evaluo 5" 5)


constEager :: a -> b -> a
constEager !x !y = x


unos :: [Number]
unos = 1 : unos

repetir :: a -> [a]
repetir valor = valor : repetir valor

replicar :: Number -> a -> [a]
replicar cantidadDeVeces valor =
    (take cantidadDeVeces . repetir) valor

naturales :: [Number]
naturales = 1 : map (+1) naturales
-- 1 : map (+1) naturales
-- 1 : map (+1) (1 : map (+1) naturales)
-- 1 : (1 + 1 : map (+1) (map (+1) naturales))
-- 1 : 2 : (map (+1) (map (+1) naturales))

-- naturales = map (+1) unos

losNaturalesPares :: [Number]
losNaturalesPares = 2 : map (+2) losNaturalesPares
losNaturalesPares' :: [Number]
losNaturalesPares' = filter even naturales

losNaturalesImpares :: [Number]
losNaturalesImpares = filter odd naturales

serieDeFibonacci :: [Number]
serieDeFibonacci = 0 : 1 : zipWith (+)
                                   serieDeFibonacci
                                   (tail serieDeFibonacci)
-- 0 | 1 | 1 | 2 | 3
--   | 0 | 1 | 1 | 2 | 3

-- 0 | 1 | 1 | 2 | 3

-- 0 -> 1 -> 1 -> 2 -> 3 -> 5 -> 8 -> 13 -> 21
