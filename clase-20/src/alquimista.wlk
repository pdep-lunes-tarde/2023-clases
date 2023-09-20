class Alquimista {
	const registroDeVentas = new Dictionary()

	method vendio(quien, pocion) {
		registroDeVentas.put(
			quien,
			self.pocionesQueLeVendioA(quien).copyWith(pocion)
		)
	}
	
	method pocionesVendidas() {
		return registroDeVentas.values().flatten()
	}
	
	method clientes() {
		return registroDeVentas.keys()
	}
	
	method pocionesQueLeVendioA(cliente) {
		return registroDeVentas.getOrElse(
			cliente,
			{ return [] }
		)
	}
	
	method cuantasVendioA(cliente) {
		return self.pocionesQueLeVendioA(cliente).size()
	}
	
	method cuantosClientesTiene() {
		return self.clientes().size()
	}
	
	method esGourmet() {
		return not self.pocionesVendidas().isEmpty()
			&& self.pocionesVendidas().all({
					pocion => pocion.rareza() > 5
				})
	}
}

//tomi.vendio(juani, new Pocion())
//tomi.vendio(emi, new Pocion())
//tomi.vendio(emi, new Pocion())

//tomi.cuantosClientesTiene() -> 2