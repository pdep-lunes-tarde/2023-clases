object bigoteDeGato {
	method rareza() {
		return 1
	}
	method hervir() {
		
	}
}

class Trebol {
	var hojas
	
	method hojas() {
		return hojas
	}
	
	method rareza() {
		if(hojas == 4) {
			return 20
		} else {
			return 1
		}
	}
	
	method hervir() {
		hojas -= 1
	}
}

class HiedraVenenosa {
	var concentracionDeVeneno
	method rareza() {
		return concentracionDeVeneno
	}
	method hervir() {
		concentracionDeVeneno *= 2
	}
	method concentracionDeVeneno() {
		return concentracionDeVeneno
	}
}