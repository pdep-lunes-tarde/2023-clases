object bigoteDeGato {
	method rareza() {
		return 1
	}
}

class Trebol {
	const hojas
	method rareza() {
		if(hojas == 4) {
			return 20
		} else {
			return 1
		}
	}
}

class HiedraVenenosa {
	const concentracionDeVeneno
	method rareza() {
		return concentracionDeVeneno
	}
}