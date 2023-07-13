trabajador(migue, profesion(maestro, cocinero), ollaEssen).
trabajador(carla, profesion(maestro, alquimista), mechero).
trabajador(feche, profesion(aprendiz, mecanico), llaveInglesa).
trabajador(aye, profesion(aprendiz, alquimista), piedraFilosofal).

tieneHerramienta(Trabajador, Herramienta):-
    trabajador(Trabajador, _, Herramienta).

mismaArea(profesion(_, Area), profesion(_, Area)).

camaradas(UnTrabajador, OtroTrabajador):-
    trabajador(UnTrabajador, Profesion, _),
    trabajador(OtroTrabajador, OtraProfesion, _),
    mismaArea(Profesion, OtraProfesion),
    UnTrabajador \= OtroTrabajador.

% Migue es maestro cocinero y su herramienta es una olla essen.
% Carla es maestra alquimista y su herramienta es un mechero.
% Feche es aprendiz de mecánico y su herramienta es una llave inglesa.
% Aye es oficial alquimista y su herramienta es una piedra filosofal.

% Queremos saber quienes son camaradas:
% son aquellas personas que
% trabajan en el mismo área



% Queremos saber quienes pueden entrenar a quienes:
% deben ser camaradas y quién entrena tiene
% que tener más experiencia

puedeEntrenar(Profesor, Alumno):-
    camaradas(Profesor, Alumno),
    tieneMasExperiencia(Profesor, Alumno).

tieneMasExperiencia(Profesor, Alumno):-
    trabajador(Profesor, profesion(RangoProfesor, _), _),
    trabajador(Alumno, profesion(RangoAlumno, _), _),
    esMayorExperiencia(RangoProfesor, RangoAlumno).

% aprendiz < oficial < experto < maestro

% esMayorExperiencia(MayorRango, MenorRango).

esMayorExperiencia(MayorRango, MenorRango):-
    rangoSiguiente(MayorRango, RangoIntermedio),
    esMayorExperiencia(RangoIntermedio, MenorRango).

esMayorExperiencia(MayorRango, MenorRango):-
    rangoSiguiente(MayorRango, MenorRango).


% rangoSiguiente(doctor, experto).
rangoSiguiente(maestro, experto).
rangoSiguiente(experto, oficial).
rangoSiguiente(oficial, aprendiz).

% Tareas, ¿Quién puede hacer cada una?

% puedeRealizarla(Trabajador, Tarea).

cocinero(Trabajador):-
    trabajador(Trabajador, profesion(_, cocinero), _).

puedeRealizarla(
    Trabajador,
    cocinarMilanesasConPure):-
    cocinero(Trabajador).

puedeRealizarla(Trabajador,
    recalentarComida):-
    cocinero(Trabajador).
puedeRealizarla(Trabajador,
    recalentarComida):-
    tieneHerramienta(Trabajador, mechero).

% natural(1).
% natural(N):-
%     natural(Anterior),
%     N is Anterior + 1.

% puedeRealizarla(migue, Tarea):-
%     trabajador(Trabajador, _, _),
%     Trabajador \= migue,
%     puedeRealizarla(Trabajador, Tarea).

puedeRealizarla(Trabajador,
    producirMedicina(_)):-
    trabajador(Trabajador,
                profesion(Rango, alquimista),
                _),
    esMayorExperiencia(Rango, oficial).

puedeRealizarla(Trabajador,
    producirMedicina(Cantidad)):-
    between(1, 100, Cantidad),
    trabajador(Trabajador,
                profesion(Rango, alquimista),
                _),
    not(esMayorExperiencia(Rango, oficial)).
    
% reparar un aparato: para cada aparato sabemos con qué herramienta se puede arreglar. Y solo puede ser arreglado por alguien que trabaje en mecánica y tenga esa herramienta.

puedeRealizarla(Trabajador,
    repararAparato(HerramientaNecesaria)):-
    trabajador(Trabajador,
                profesion(_, mecanico), HerramientaNecesaria).
puedeRealizarla(migue, repararAparato(_)).

% cocinar milanesas con puré: puede hacerlo cualquier cocinero.

% recalentar comida: puede hacerlo cualquier cocinero o cualquiera que tenga un mechero.

% producir cierta cantidad de medicina: alquimistas de oficiales para abajo pueden hacer solo hasta 100 gramos, alquimistas de grado más alto pueden hacer cualquier cantidad.

% reparar un aparato: para cada aparato sabemos con qué herramienta se puede arreglar. Y solo puede ser arreglado por alguien que trabaje en mecánica y tenga esa herramienta.
% Además, Migue se da maña arreglando cualquier cosa así que siempre puede reparar lo que sea.

puedeRealizarla(Trabajador,
    obraMaestra(Area)):-
    trabajador(Trabajador,
        profesion(maestro, Area),
        _).
puedeRealizarla(Trabajador,
    obraMaestra(alquimista)):-
    trabajador(Trabajador, _, piedraFilosofal).

% Tareas, ¿Quién puede hacer cada una?

% crear obra maestra de un área: donde el área podría ser alquimia, cocina, mecánica, etc.
% Sólo puede ser hecha por una persona que tenga maestría en ese área.
% Además, en el caso de la alquimia cualquiera con una piedra filosofal puede crear una obra maestra.

% -------------

% ¿puede cubrir?

% Una persona puede cubrir a otra en cierta tarea si ambas pueden hacerla.

puedeCubrir(QuienCubre, Cubierto, Tarea):-
    puedeRealizarla(QuienCubre, Tarea),
    puedeRealizarla(Cubierto, Tarea),
    QuienCubre \= Cubierto.


% ¿es irremplazable?

% Una persona es irremplazable para una tarea si puede hacerla y nadie puede cubrirla para la misma.

esIrremplazable(Trabajador, Tarea):-
    puedeRealizarla(Trabajador, Tarea),
    forall(
        trabajador(OtroTrabajador,_,_),
        not(puedeCubrir(OtroTrabajador, Trabajador, Tarea))
        ).

% comodín

% Decimos que una persona es un comodín si puede realizar todas las tareas conocidas.

comodin(Trabajador):-
    trabajador(Trabajador, _, _),
    forall(
        pjuedeRealizarla(_, Tarea),
        puedeRealizarla(Trabajador, Tarea)).
