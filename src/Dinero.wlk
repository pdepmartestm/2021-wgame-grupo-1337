//Clase para manejar la fabricacion y obtencion de bundles de billetes
import Entidad.*
import sonidoItem.*
import Pantalla.*

class Dinero inherits Entidad{
	
	var property dineroCantidad = 10
	
	override method image() = "dinero.png"
	
	method modificar(auto){
	}
	
	override method colision(autoJugador){
		autoJugador.puntos(autoJugador.puntos() + (pantalla.puntajeBaseVelocidad() * 0.2))
		autoJugador.plata(autoJugador.plata() + dineroCantidad)
		sonidoItem.playItem()
	}
}
