import Entidad.*
import wollok.game.*

//Bate: 50 puntos
//Espada: 100 puntos
//Pistola: 200 puntos
//Ametralladora: 500 puntos
class Arma inherits Entidad{
	var property sprite = []
	method puntaje()
	override method colision(autoJugador){
		autoJugador.puntos(autoJugador.puntos() + self.puntaje())
	}
	
}

class Bate inherits Arma {
	override method puntaje() = 50
	override method image() = "bate.png"
}

class Espada inherits Arma {
	override method puntaje() = 100
	override method image() = "espada.png"
}

class Pistola inherits Arma {
	override method puntaje() = 200
	override method image() = "pistola.png"
}

class Ametralladora inherits Arma {
	override method puntaje() = 500
	override method image() = "ametralladora.png"
}
