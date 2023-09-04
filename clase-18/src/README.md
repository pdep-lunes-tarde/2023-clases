# Pepita, vola!

## Conozcamos a Pepita

Pepita es una golondrina que sabe volar y comer.
Inicialmente tiene 55 joules de energía.

Sabemos que:
* Al volar gasta 5 joules de energía por cada kilómetro volado.
* Por cada gramo que come gana 1 joule de energía

Queremos hacer con pepita desde la consola:
* Consultar su energía
* Darle de comer 45 gramos de alpiste
* Saber cuánta energía tiene en ese momento
* Que vuele 10 kilómetros
* Volver a preguntarle su energía

## Aparece Josefa

Queremos agregar a nuestro sistema a Josefa, 
que también sabe volar y comer, sólo que lo hace distinto.

A Josefa parece interesarle cuánto le pedimos que vuele y 
cuánto le pedimos que coma. Entonces en vez de recordar cuánta energía tiene, 
prefiere calcular esa información.

La energía de Josefa se calcula como 
`su energía inicial + 5 * gramos comidos - 3 * kilómetro volados`. 
La energía inicial de Josefa es 100.

Cuando le pedimos que coma una cantidad de gramos de alpiste o 
que vuele una cantidad de kilómetros sólo necesitamos aumentar los gramos 
comidos o kilómetros volados respectivamente.

Además a Josefa le podemos preguntar cómo se siente, y debe respondernos:
* "Explotada" si la hicimos volar pero no la alimentamos
* "Bonita y gordita" si le dimos más de comer de lo que la hicimos volar
* "Enérgica" si su energía es mayor a su energía inicial
* "Indiferente" en cualquier otro caso

> Jugar un poco con Josefa desde la consola, haciendo que vuele y que coma, consultando su energía y su estado emocional.

## Entrenador de pajaritos

Agregamos a nuestro sistema al entrenador, que tiene asignado un pajaro y lo puede entrenar cuando se lo pidamos. Su rutina de entrenamiento es la siguiente:
* Alimentar al pajarito 10 gramos de alpiste
* Mandarlo a volar 20 kilómetros
* Si la energía del pajarito es menor a 20, darle de comer 10 gramos de alpiste, de lo contrario darle de comer 2 gramos.
También, podemos asignarle un pajaro distinto.

> Hacer que el entrenador entrene a Pepita y luego a Josefa.

## Última extensión

Queremos a agregar un ave que tiene una compañera, su nombre es Beti y se va a comportar así:
* su energía va a ser la misma que la de su compañera, 
* cuando come x cantidad de alpiste, le da de comer la mitad a su compañera,
* cuando vuela x kms, su compañera también.

Necesitamos poder indicarle a Beti quién es su compañera, y queremos que el entrenador también pueda entrenar a Beti.
