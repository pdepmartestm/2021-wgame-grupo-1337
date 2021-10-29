import Entidad.*
import wollok.game.*

class Llave inherits Entidad{
	var property reparacion = 1
	
	override method image() = "llave inglesa.png"
	
	override method colision(auto){
		const sonidoItem = game.sound("sonidoItem.mp3")
		auto.vida(auto.vida() + reparacion)
		game.schedule(100, {sonidoItem.play()})
		
	}
}
