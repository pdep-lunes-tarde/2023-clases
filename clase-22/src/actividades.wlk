class EscucharMusica {
	method hacerse(unEstudiante) {
		unEstudiante.estresado(false)
	}
	
	method laPuedeHacer(unEstudiante) = true
}

class EscucharCancionFavorita inherits EscucharMusica {
	override method hacerse(unEstudiante) {
		super(unEstudiante)
		unEstudiante.recuperarEnergia(20)
	}
}

class Estudiar {
	const dificultadTema
	const horas

	method hacerse(estudiante) {
		estudiante.horasDeEstudio(estudiante.horasDeEstudio() + horas)

		estudiante.cansarse(horas * dificultadTema)
	}
	
	method laPuedeHacer(unEstudiante) = unEstudiante.concentrado()
}

// Este objeto nos permite construir las actividades de estudiar temas de diferente dificultad.
// Por más de que no tengamos una clase para cada tema porque se repetía la lógica, con esto
// seguimos teniendo representada la idea de temas faciles, regulares y difíciles en el código
object estudiar {
	method temaFacil(horas) = new Estudiar(dificultadTema=1, horas=horas)
	method temaRegular(horas) = new Estudiar(dificultadTema=5, horas=horas)
	method temaDificil(horas) = new Estudiar(dificultadTema=10, horas=horas)
}

class TomarCafe inherits TomarBebida {
	const cafeina
	override method aplicarEfecto(unEstudiante) {
		unEstudiante.recuperarEnergia(30)
   		if(cafeina > 200)
     	 unEstudiante.estresado(true)
	}
}

class TomarTe inherits TomarBebida {
	override method aplicarEfecto(estudiante) {
		estudiante.recuperarEnergia(5)
		estudiante.estresado(false)
	}
}

class TomarBebida {		
	method laPuedeHacer(unEstudiante) {
		return unEstudiante.tazasLimpias() > 0
	}

	method hacerse(unEstudiante) {
		unEstudiante.ensuciarUnaTaza()
		self.aplicarEfecto(unEstudiante)
	}
	
	method aplicarEfecto(unEstudiante)
}
