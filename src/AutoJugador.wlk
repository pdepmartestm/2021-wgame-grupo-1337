import wollok.game.*
import Entidad.*
object autoJugador{
	
	var property image = "Auto_Derecho.png"
	var property position = game.at(3,0)
	var property vida = 5
	var property puntos = 0
	var property plata = 0
	
	method move(nuevaPosicion) {
		position = nuevaPosicion
	}
	
	method enderezar(){
		game.schedule(1 * 200, {self.image("Auto_Derecho.png")})
	}
}
