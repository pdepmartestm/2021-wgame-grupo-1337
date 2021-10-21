//Clase para manejar la fabricacion y obtencion de bundles de billetes
import Entidad.*
class Dinero inherits Entidad{
	
	var property dineroCantidad = 10
	
	override method image() = "dinero.png"
	
	method modificar(auto){
		auto.puntos(auto.puntos() + 20)
		auto.plata(auto.plata() + dineroCantidad)
	}
}
