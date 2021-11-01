import Entidad.*
import wollok.game.*
import sonidoItem.*
import Pantalla.*

//Bate: 50 puntos
//Espada: 100 puntos
//Pistola: 200 puntos
//Ametralladora: 500 puntos
class Arma inherits Entidad{
	var property sprite = []
	method puntaje()
	override method colision(autoJugador){
		autoJugador.puntos(autoJugador.puntos() + self.puntaje())
		sonidoItem.playItem()
	}
	
}

class Bate inherits Arma {
	override method puntaje() = pantalla.puntajeBaseVelocidad() * 0.1
	override method image() = "bate.png"
}

class Espada inherits Arma {
	override method puntaje() = pantalla.puntajeBaseVelocidad() * 0.2
	override method image() = "espada.png"
}

class Pistola inherits Arma {
	override method puntaje() = pantalla.puntajeBaseVelocidad() * 0.5
	override method image() = "pistola.png"
}

class Ametralladora inherits Arma {
	override method puntaje() = pantalla.puntajeBaseVelocidad()
	override method image() = "ametralladora.png"
}
