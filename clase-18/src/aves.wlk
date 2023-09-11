// encapsulamiento: solo el mismo objeto puede modificar su estado interno.
object pepita {
	var energia = 100
	method nombre() {
		return "pepita"
	}
	method nombreParaImagen() {
		return "pepita"
	}
	method volar(kilometros) {
		self.cambiarEnergia(
			energia - 5 * kilometros - 40
		)
	}
	method comer(gramos) {
		self.cambiarEnergia(energia + gramos * 2)
	}
	method cambiarEnergia(nuevaEnergia) {
		energia = nuevaEnergia.max(0).min(100)
	}
	method dameTuEnergia() {
		return energia
	}
}

object josefa {
	const energiaInicial = 80
	var kilometrosVolados = 0
	var gramosComidos = 0

	method volar(kilometros) {
		kilometrosVolados =
			kilometrosVolados + kilometros
	}
	method comer(gramos) {
		gramosComidos =
			gramosComidos + gramos
	}
	method dameTuEnergia() {
		return energiaInicial -
			kilometrosVolados * 5 +
			gramosComidos * 3
	}
	method nombreParaImagen() {
		return "josefa"
	}
	method nombre() {
		return "josefa"
	}
}
