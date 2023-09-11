import wollok.game.*
import aves.*
import entrenador.*

object entrenar {
	method apply() {
		entrenador.entrenar()
	}
	method asClosure() {
		return self
	}
	method doApply() {
		entrenador.entrenar()
	}
}

object pantalla {
	method iniciar() {
		game.width(5)
		game.height(5)
		game.cellSize(50)
		game.addVisual(entrenadorDisplay)
		game.addVisual(pajaroDisplay)
		game.addVisual(informacionDelPajaro)
		keyboard.a().onPressDo(entrenar)
		game.start()
	}
}

object entrenadorDisplay {
	method position() {
		return game.origin().up(1)
	}
	method image() {
		return "entrenador.png"
	}
}
object pajaroDisplay {
	method position() {
		return entrenadorDisplay.position().up(2).right(3)
	}
	method image() {
		return entrenador.nombreImagenPajaroAsignado() + "-chica.png"
	}
}

object informacionDelPajaro {
	method position() {
		return pajaroDisplay.position()
	}
	method textColor() {
		if(entrenador.energiaPajaroAsignado() < 10) {
			return "FF0000"			
		} else {
			return "00FF00"
		}
		
	}
	method text(){
		return
			"\n" +
			entrenador.nombrePajaroAsignado().capitalize() +
			"\n" +
			"Energia: " + entrenador.energiaPajaroAsignado()
	}
}
