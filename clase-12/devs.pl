% Sabemos que:
% Nahuel programa en JavaScript
% Juan programa en Haskell y Ruby
% Caro programa en Haskell y Scala
% Tito no programa en ningún lenguaje

programaEn(nahuel, javascript).
programaEn(juan, haskell).
programaEn(juan, ruby).
programaEn(caro, haskell).
programaEn(caro, scala).
programaEn(caro, javascript).

sonColegas(UnaPersona,OtraPersona):-
    %   UnaPersona=juan  UnLenguaje=haskell
    programaEn(UnaPersona, UnLenguaje),
    % programaEn(OtraPersona, haskell)
    % OtraPersona=caro
    programaEn(OtraPersona, UnLenguaje),
    % juan \= caro
    UnaPersona \= OtraPersona.


lenguaje(javascript).
lenguaje(haskell).
lenguaje(ruby).
lenguaje(scala).

% Queremos implementar si una persona puede aprender un lenguaje de otra. Esto se cumple cuando la primera no programa en ese lenguaje y la segunda sí.

% Por ejemplo, nahue puede aprender scala de caro porque nahue no programa en scala y caro sí.

% Lenguaje = scala
% Maestro = caro
puedeAprenderDe(Aprendiz, Lenguaje, Maestro):-
    noProgramaEn(Aprendiz, Lenguaje),
    programaEn(Maestro, Lenguaje).

noProgramaEn(Persona, Lenguaje):-
    programaEn(_, Lenguaje),
    programaEn(Persona, _),
    not(programaEn(Persona, Lenguaje)).


% Sabemos que alguien es irremplazable si programa en un lenguaje en el cual nadie más programa.

irremplazable(Persona, Lenguaje):-
    programaEn(Persona, Lenguaje),
    not(
        (programaEn(Colega, Lenguaje),
        Colega \= Persona)
        ).

colegaRespectoDeLenguaje(Persona, Colega, Lenguaje):-
    programaEn(Persona, Lenguaje),
    programaEn(Colega, Lenguaje),
    Persona \= Colega.


:-begin_tests(intro_logico).

test(una_persona_puede_aprender_un_lenguaje_de_otra_si_desconoce_un_lenguaje_en_el_que_la_otra_programa, nondet):-
    puedeAprenderDe(nahuel, scala, caro).

test(una_persona_no_puede_aprender_un_lenguaje_de_otra_si_ya_conoce_el_lenguaje):-
    not(puedeAprenderDe(caro, haskell, juan)).

test(una_persona_no_puede_aprender_un_lenguaje_de_otra_si_la_otra_persona_no_conoce_el_lenguaje):-
    not(puedeAprenderDe(nahuel, scala, juan)).

test(una_persona_es_irremplazable_si_es_la_unica_que_programa_en_algun_lenguaje):-
  irremplazable(caro, scala).

test(una_persona_NO_es_irremplazable_en_un_lenguaje_si_alguien_mas_programa_en_ese_lenguaje):-
  not(irremplazable(caro, haskell)).

test(una_persona_NO_es_irremplazable_si_no_hay_ningun_lenguaje_en_el_cual_sea_la_unica_que_programa):-
  not(irremplazable(nahuel, _)).

:-end_tests(intro_logico).
