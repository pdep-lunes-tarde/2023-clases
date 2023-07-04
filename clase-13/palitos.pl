/*animal(Nombre,Clase, Medio)*/
animal(ballena,mamifero,acuatico).
animal(tiburon,pez,acuatico).
animal(lemur,mamifero,terrestre).
animal(golondrina,ave,aereo).
animal(tarantula,insecto,terrestre).
animal(lechuza,ave,aereo).
animal(orangutan,mamifero,terrestre).
animal(tucan,ave,aereo).
animal(puma,mamifero,terrestre).
animal(abeja,insecto,aereo).
animal(leon,mamifero,terrestre).
animal(lagartija,reptil,terrestre).

/* tiene(Quien, Que, Cuantos)*/
tiene(nico, ballena, 1).
tiene(nico, lemur, 2).
tiene(maiu, lemur, 1).
tiene(maiu, tarantula, 1).
tiene(juanDS, golondrina, 1).
tiene(juanDS, lechuza, 1).
tiene(juanR, tiburon, 2).
tiene(nico, golondrina, 1).
tiene(juanDS, puma, 1).
tiene(maiu, tucan, 1).
tiene(juanR, orangutan,1).
tiene(maiu,leon,2).
tiene(juanDS,lagartija,1).
tiene(feche,tiburon,1).

leGusta(nico, Animal):-
    animal(Animal, _, terrestre),
    Animal \= lemur.

leGusta(maiu, abeja).
leGusta(maiu, Animal):-
    animal(Animal, Clase, _),
    Clase \= insecto.

leGusta(juanDS, Animal):-
    animal(Animal, _, acuatico).
leGusta(juanDS, Animal):-
    animal(Animal, ave, _).

leGusta(juanR, Animal):-
    tiene(juanR, Animal, _).

leGusta(feche, lechuza).

animalDificil(Animal):-
    animal(Animal, _, _),
    not(tiene(_, Animal, _)).

animalDificil(Animal):-
    tiene(Persona, Animal, 1),
    nadieMasLoTiene(Persona, Animal).

nadieMasLoTiene(Persona, Animal):-
    tiene(Persona, Animal, _),
    not((
        tiene(OtraPersona, Animal, _),
        Persona \= OtraPersona
    )).

tieneParaIntercambiar(Persona, Animal):-
    tiene(Persona, Animal, _),
    not(leGusta(Persona, Animal)).

tieneParaIntercambiar(Persona, Animal):-
    tiene(Persona, Animal, Cantidad),
    Cantidad > 1.

tieneParaIntercambiar(juanR, Animal):-
    tiene(juanDS, Animal, _).

tieneParaOfrecerle(QuienOfrece,
                    QuienRecibe,
                    Animal):-
    tieneParaIntercambiar(QuienOfrece, Animal),
    leGusta(QuienRecibe, Animal),
    not(tiene(QuienRecibe, Animal, _)).

puedenNegociar(UnaPersona, OtraPersona):-
    tieneParaOfrecerle(UnaPersona, OtraPersona, _),
    tieneParaOfrecerle(OtraPersona, UnaPersona, _).

estaTriste(Persona):-
    tiene(Persona, _, _),
    forall(tiene(Persona, Animal, _),
            not(leGusta(Persona, Animal))).

estaFeliz(Persona):-
    tiene(Persona, _, _),
    forall(tiene(Persona, Animal, _),
            leGusta(Persona, Animal)).

tieneTodosDe(Persona, Categoria):-
    tiene(Persona, _, _),
    esDeCategoria(_, Categoria),
    forall(tiene(Persona, Animal, _),
            esDeCategoria(Animal, Categoria)).

esDeCategoria(Animal, Clase):-
    animal(Animal, Clase, _).
esDeCategoria(Animal, Medio):-
    animal(Animal, _, Medio).

completoLaColeccion(Persona):-
    tiene(Persona, _, _),
    forall(animal(Animal, _, _),
        tiene(Persona, Animal, _)).

manejaElMercado(Persona):-
    tiene(Persona, _, _),
    forall(
        (
            OtraPersona \= Persona,
            tiene(OtraPersona, _, _)
        ),
            tieneParaOfrecerle(Persona, OtraPersona)
    ).

delQueMasTiene(Persona, Animal):-
    tiene(Persona, Animal, Cantidad),
    forall(
        (
            tiene(Persona, OtroAnimal, CantidadDeOtro),
            OtroAnimal \= Animal
        ),
        Cantidad > CantidadDeOtro
    ).


:- begin_tests(palitos).

test(si_un_animal_es_terrestre_y_no_es_el_lemur_le_gusta_a_nico, nondet):-
  leGusta(nico, tarantula).

test(a_nico_no_le_gusta_el_lemur_por_mas_que_sea_terrestre, nondet):-
  not(leGusta(nico, lemur)).

test(si_un_animal_no_es_terrestre_no_le_gusta_a_nico):-
    not(leGusta(nico, ballena)).

test(a_maiu_no_le_gustan_los_insectos_que_no_son_abejas):-
    not(leGusta(maiu, tarantula)).

test(a_maiu_le_gustan_las_abejas, nondet):-
   leGusta(maiu, abeja).

test(a_maiu_le_gustan_todos_los_animales_que_no_son_insectos, nondet):-
    leGusta(maiu, lemur).

test(a_juan_le_gustan_los_animales_acuaticos, nondet):-
    leGusta(juanDS, ballena).

test(a_juan_le_gustan_las_aves, nondet):-
    leGusta(juanDS, golondrina).

test(a_juan_no_le_gustan_animales_si_no_son_aves_o_acuaticos, nondet):-
    not(leGusta(juanDS, lemur)).

test(a_juanR_le_gustan_solo_los_animales_que_tiene, nondet):-
    leGusta(juanR, tiburon).

test(a_juanR_no_le_gustan_los_animales_que_no_tiene, nondet):-
    not(leGusta(juanR, puma)).

test(a_feche_le_gustan_las_lechuzas):-
    leGusta(feche, lechuza).

test(a_feche_no_le_gusta_ninguno_que_no_sean_lechuzas):-
    not(leGusta(feche, tiburon)).

test(un_animal_es_dificil_si_nadie_lo_tiene, nondet):-
    animalDificil(abeja).

test(un_animal_es_dificil_si_alguien_tiene_uno_solo_de_ese, nondet):-
    animalDificil(tucan).

test(un_animal_no_es_dificil_si_alguien_lo_tiene_mas_de_una_vez):-
    not(animalDificil(leon)).

test(un_animal_no_es_dificil_si_al_menos_dos_personas_lo_tienen):-
    not(animalDificil(golondrina)).

test(una_persona_tiene_para_intercambiar_un_animal_si_lo_tiene_y_no_le_gusta, nondet):-
    tieneParaIntercambiar(maiu, tarantula).

test(una_persona_tiene_para_intercambiar_un_animal_si_lo_tiene_repetido, nondet):-
    tieneParaIntercambiar(maiu, leon).

test(una_persona_no_tiene_para_intercambiar_un_animal_que_tenga_una_sola_vez_y_le_guste):-
    not(tieneParaIntercambiar(juanDS, golondrina)).

test(juanR_tiene_para_intercambiar_los_animales_que_tiene_juanDS, nondet):-
    tieneParaIntercambiar(juanR, golondrina).

test(una_persona_tiene_para_ofrecerle_animales_a_otra_si_los_tiene_para_intercambiar_y_a_la_otra_persona_le_gustan_y_no_los_tiene, nondet):-
    tieneParaOfrecerle(maiu, nico, leon).

test(una_persona_no_puede_ofrecer_un_animal_que_no_puede_intercambiar):-
    not(tieneParaOfrecerle(maiu, nico, orangutan)).

test(una_persona_no_puede_ofrecer_a_otra_un_animal_que_la_otra_ya_tiene):-
    not(tieneParaOfrecerle(nico, maiu, lemur)).

test(una_persona_no_puede_ofrecer_a_otra_un_animal_que_no_le_gusta):-
    not(tieneParaOfrecerle(maiu, leon, feche)).

test(dos_personas_pueden_negociar_si_pueden_ofrecerse_animales_mutuamente, nondet):-
    puedenNegociar(maiu, nico).

test(dos_personas_no_pueden_neogicar_si_no_pueden_ofrecerse_animales_mutuamente, nondet, nondet):-
    puedenNegociar(juan, maiu).

test(una_persona_esta_triste_si_tiene_solo_animales_que_no_le_gustan, nondet):-
    estaTriste(nico).

test(una_persona_no_esta_triste_si_tiene_algun_animal_que_le_gusta, nondet):-
    not(estaTriste(maiu)).

test(una_persona_esta_feliz_si_le_gustan_todos_los_animales_que_tiene, nondet):-
    estaFeliz(juanR).

test(una_persona_no_esta_feliz_si_tiene_algun_animal_que_no_le_gusta, nondet):-
    not(estaFeliz(maiu)).

test(una_persona_tiene_todos_de_un_medio_si_todos_sus_animales_son_de_ese_medio):-
    tieneTodosDe(feche, acuatico).

test(una_persona_tiene_todos_de_una_clase_si_todos_sus_animales_son_de_esa_clase):-
    tieneTodosDe(feche, pez).

test(una_persona_no_tiene_todos_de_un_medio_o_clase_si_tiene_al_menos_alguno_que_no_sea_de_ese_medio_o_clase, nondet):-
    not(tieneTodosDe(juanDS, terrestre)).

test(una_persona_no_completo_la_coleccion_si_le_falta_algun_animal):-
    not(completoLaColeccion(juanDS)).

:- end_tests(palitos).