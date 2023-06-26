% Registramos las caracterísicas de las lechuzas de la zona (nombre, sospechosidad y nobleza) con un predicado lechuza/3.

% Necesitamos saber:
% 1-¿Qué tan violenta es una lechuza?
% Se calcula como 5 * sospechosidad + 42 / nobleza.
% 2- Si una lechuza es vengativa. Lo es si su violencia es mayor a 100.
% 3- Si una lechuza es mafiosa, que se cumple si no es buena gente o su sospechosidad es al menos 75. Decimos que es buena gente si no es vengativa y su nobleza es mayor a 50.

:- begin_tests(lechuzas).

:- end_tests(lechuzas).

