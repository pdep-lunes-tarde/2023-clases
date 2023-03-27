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
    (mod año 4 == 0 && mod año 100 /= 0) || mod año 400 == 0
-- Un año es bisiesto si es divisible por 400 o
-- si es divisible por 4 pero no por 100.
