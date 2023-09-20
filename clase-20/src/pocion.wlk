
class Pocion {
	const ingredientes = new List()

	method cantidadDeIngredientes() {
		return ingredientes.size()
	}

	method agregarIngrediente(ingrediente) {
		ingredientes.add(ingrediente)
	}
	
	method agregarIngredientes(nuevosIngredientes) {
		ingredientes.addAll(nuevosIngredientes)
	}
	
	
	method destilar() {  
		ingredientes.removeAllSuchThat({
			ingrediente => ingrediente.rareza() <= 5
		})
	}
	
	method rareza() {
		if(ingredientes.isEmpty()) {
			return 0
		} else {
			const rarezaTotal =
				ingredientes
					.sum({ elemento => elemento.rareza() })
			return rarezaTotal / self.cantidadDeIngredientes()	
		}
	}
	
	method hervir() {
		ingredientes.forEach({
			ingrediente => ingrediente.hervir()
		})
	}
}

