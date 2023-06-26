% Registramos las caracterísicas de las lechuzas de la zona (nombre, sospechosidad y nobleza) con un predicado lechuza/3.

%lechuza(Lechuza, Sospechosidad, Nobleza)
lechuza(duo, 10, 2).
lechuza(noctowl, 20, 42).
lechuza(prolog, 10, 51).
lechuza(coo, 80, 55).

violencia(Lechuza, Violencia):-
    lechuza(Lechuza, Sospechosidad, Nobleza),
    Violencia is 5 * Sospechosidad + 42 / Nobleza.

vengativa(Lechuza):-
    violencia(Lechuza, Violencia),
    Violencia > 100.

esBuenaGente(Lechuza):-
    lechuza(Lechuza, _, Nobleza),
    not(vengativa(Lechuza)),
    Nobleza > 50.

esBuenaGente(coo).

mafiosa(Lechuza):-
    lechuza(Lechuza, _, _),
    not(esBuenaGente(Lechuza)).

mafiosa(Lechuza):-
    lechuza(Lechuza, Sospechosidad, _),
    Sospechosidad >= 75.

% Necesitamos saber:
% 1-¿Qué tan violenta es una lechuza?
% Se calcula como 5 * sospechosidad + 42 / nobleza.
% 2- Si una lechuza es vengativa. Lo es si su violencia es mayor a 100.
% 3- Si una lechuza es mafiosa, que se cumple si no es buena gente o su sospechosidad es al menos 75. Decimos que es buena gente si no es vengativa y su nobleza es mayor a 50.

:- begin_tests(lechuzas).

test(la_violencia_de_una_lechuza_es_5_por_su_sospechosidad_mas_42_dividido_su_nobleza, nondet):-
    violencia(duo, 71).

test(una_lechuza_es_vengativa_si_su_violencia_es_mayor_a_100, nondet):-
    vengativa(noctowl).

test(una_lechuza_no_es_vengativa_si_su_violencia_es_menor_a_100, nondet):-
    not(vengativa(duo)).

test(una_lechuza_es_mafiosa_si_no_es_buena_gente, nondet):-
    mafiosa(duo).

 test(una_lechuza_es_mafiosa_si_su_sospechosidad_es_75_o_mas, nondet):-
     mafiosa(coo).

test(una_lechuza_no_es_mafiosa_si_su_sospechosidad_es_menor_a_75_y_es_buena_gente, nondet):-
    not(mafiosa(prolog)).

:- end_tests(lechuzas).

