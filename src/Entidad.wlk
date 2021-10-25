import wollok.game.*
import Pantalla.*
class Entidad {
	
	var property image = ""
	var property position
	
	method move(nuevaPosicion) {
		position = nuevaPosicion
	}
	method irCayendo(){
		game.onTick(pantalla.velocidad(), "CAIDAS", {
			position = game.at(position.x(), (-1).max(position.y() - 1))
			if(self.position().y() < 0){
				game.removeTickEvent("CAIDAS")
				game.removeVisual(self)
			}
		})
	}
	
	method colision(autoJugador)
	
}
