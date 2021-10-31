import Entidad.*
import wollok.game.*
import sonidoItem.*

class Llave inherits Entidad{
	var property reparacion = 1
	
	override method image() = "llave inglesa.png"
	
	override method colision(auto){
		auto.vida(auto.vida() + reparacion)
		sonidoItem.playItem()
	}
}
