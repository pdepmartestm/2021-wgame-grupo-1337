import wollok.game.*
import Entidad.*
class AutoJugador inherits Entidad{
	
	var property vida = 100
	var property puntos = 0
	var property plata = 0
	
	method enderezar(){
		game.schedule(1 * 1000, {self.image("Auto_Derecho.png")})
	}
	override method colision(autoJugador){
		//No deberia colisionar consigo mismo asi que se deja sin funcionalidad
	}
}
