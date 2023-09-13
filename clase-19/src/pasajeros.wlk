class Pasajero {
	var personalidad
	var jefe = sinJefe

	method sePuedeSubir(unMicro) =
		unMicro.hayLugar() && 
			personalidad.aceptaSubirse(unMicro, jefe)
}

object sinJefe {
	method sePuedeSubir(unMicro) = true
}

object obsecuente {
	method aceptaSubirse(unMicro, jefe) =
		jefe.sePuedeSubir(unMicro)
}


object apurado {
	method aceptaSubirse(unMicro, jefe) = true
}

object claustrofobico {
	method aceptaSubirse(unMicro, jefe) =
		unMicro.volumenEnM3() > 120
}

object fiaca {
	method aceptaSubirse(unMicro, jefe) = unMicro.hayAsientosLibres()	
}



