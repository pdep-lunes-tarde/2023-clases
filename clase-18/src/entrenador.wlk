import aves.*

//Agregamos a nuestro sistema a un entrenador. Su rutina de entrenamiento para un parajito es la siguiente:
//Darle de comer 10 gramos de alpiste
//Mandarlo a volar 20 kilómetros
//Si luego de volar la energía del pajarito es menor a 20, darle de comer 10 gramos de alpiste, de lo contrario darle de comer 2 gramos.

object entrenador {
	var ave = pepita
	method tuAveEs(unAve) {
		ave = unAve
	}
	method entrenar() {
		ave.comer(10)
		ave.volar(20)
		if(ave.dameTuEnergia() < 20) {
			ave.comer(10)
		} else {
			ave.comer(2)
		}
	}
	method nombreImagenPajaroAsignado() {
		return ave.nombreParaImagen()
	}
	method energiaPajaroAsignado() {
		return ave.dameTuEnergia()
	}
	method nombrePajaroAsignado() {
		return ave.nombre()
	}
}
