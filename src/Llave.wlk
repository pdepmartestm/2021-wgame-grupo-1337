import Entidad.*

class Llave inherits Entidad{
	var property reparacion = 50
	
	override method image() = "llave inglesa.png"
	
	override method colision(auto){
		auto.vida(auto.vida() + reparacion)
	}
}
