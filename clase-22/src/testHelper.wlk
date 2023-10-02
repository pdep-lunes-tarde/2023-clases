import estudiante.*

object testHelper {
	method estudianteConcentradoConHorasDeEstudio(unasHorasDeEstudio) =
		new Estudiante(energia=51, estresado=false, horasDeEstudio=unasHorasDeEstudio)
	method estudianteDesconcentrado() = new Estudiante(energia=0)
	
}
