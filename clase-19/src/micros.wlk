class Micro {
	const capacidadSentados
	const capacidadParados
	const volumenEnM3
	var cantidadPasajeros= 0
	
	method volumenEnM3() = volumenEnM3 
	
	method hayLugar() {
		return self.capacidadTotal() > cantidadPasajeros
	}
	
	method capacidadTotal() {
		return capacidadSentados + capacidadParados
	}
	
	method hayAsientosLibres() =
		capacidadSentados > cantidadPasajeros
	
	method seSubieronPersonas(cantidad) {
		cantidadPasajeros += cantidad
	}
}

