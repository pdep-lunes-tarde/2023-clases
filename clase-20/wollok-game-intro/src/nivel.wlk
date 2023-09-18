import wollok.game.*

object nivel {
	method armar() {
		const player = new Player(position = game.center())
		game.addVisualCharacter(player)
		const pared = new Pared(position = game.at(1, 1))
		game.addVisual(pared)
		game.onCollideDo(pared, { otroObjeto =>
			otroObjeto.chocasteConPared(pared)
		})
		game.onCollideDo(player, { otroObjeto =>
			otroObjeto.chocasteConJugador(player)
		})
	}	
}

object arriba {
	method nombre() = "up"
	method aplicaParaIrDe(posicionAnterior, posicionNueva) = posicionAnterior.y() < posicionNueva.y()
}

object abajo {
	method nombre() = "down"
	method aplicaParaIrDe(posicionAnterior, posicionNueva) = posicionAnterior.y() > posicionNueva.y()
}

object izquierda {
	method nombre() = "left"
	method aplicaParaIrDe(posicionAnterior, posicionNueva) = posicionAnterior.x() > posicionNueva.x()
}

object derecha {
	method nombre() = "right"
	method aplicaParaIrDe(posicionAnterior, posicionNueva) = posicionAnterior.x() < posicionNueva.x()
}

class Player {
	var position
	var previousPosition = position
	var direccion = abajo
	
	method position() {
		return position
	}
	
	method position(newPosition) {
		const nuevaDireccion = [arriba, abajo, izquierda, derecha].findOrElse({
			unaDireccion => unaDireccion.aplicaParaIrDe(position, newPosition)
		}, { return direccion })
		direccion = nuevaDireccion
		previousPosition = position
		position = newPosition
	}
	
	method chocasteConPared(pared) {
		position = previousPosition
	}
	
	method image() {
		return "player_" + direccion.nombre() + ".png"
	}
	
	method direccion() {
		return direccion
	}
}

class Pared {
	var position
	var image = "pared.png"
	
	method position() {
		return position
	}
	
	method image() {
		return image
	}
	
	method chocasteConJugador(jugador) {}
}


