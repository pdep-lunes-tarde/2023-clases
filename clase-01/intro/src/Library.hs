module Library where
import PdePreludat

-- Ejercicio: año bisiesto
-- REPL
-- Read
-- Evaluate
-- Print
-- Loop

esBisiesto :: Number -> Bool
esBisiesto año =
    (esDivisiblePor año 4 &&
        not (esDivisiblePor año 100))
        || esDivisiblePor año 400

esDivisiblePor :: Number -> Number -> Bool
esDivisiblePor dividendo divisor =
    mod dividendo divisor == 0
-- Un año es bisiesto si es divisible por 400 o
-- si es divisible por 4 pero no por 100.

-- int cantidadDePares(int numeros[], int tope) {
--   int i, cantidad = 0;

--   for (i=0; i < tope; i++) {
--     if(esPar(numeros[i])){
--       cantidad = cantidad + 1;
--     }
--   }

--   return cantidad
-- }

cantidadDePares :: [Number] -> Number
cantidadDePares = length . filter even
