import Entidad.*
import wollok.game.*
import sonidoItem.*

class Llave inherits Entidad{
	
	override method image() = "llave inglesa.png"
	
	override method colision(auto){
		auto.vida(auto.vida() + 1)
		auto.aumentarVida()
		sonidoItem.playItem()
	}
}
