import wollok.game.*
import Pantalla.*
class Entidad {
	
	var property image = ""
	/*
	var ultimoFrame = 0
	const animacion = [""]
	const cantidadFrame = animacion.size()
	*/
	var property position
	/*
	method siguienteFrame(){
		ultimoFrame = ultimoFrame + 1
		if(ultimoFrame == cantidadFrame) ultimoFrame = 0
		image =  animacion.get(ultimoFrame)
	}
	
	*/
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
	
}
