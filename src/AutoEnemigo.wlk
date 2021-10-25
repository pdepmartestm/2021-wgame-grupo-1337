import wollok.game.*
import Entidad.*

class AutoEnemigo inherits Entidad{
	//Hará un choque
	
	const danio
	override method image() ="enemigo_Derecho.png"
	override method colision(jugador){
		jugador.vida(jugador.vida()-danio)
		
		if(jugador.vida()<0){
			//Manejar fin del juego evento
			game.removeVisual(jugador)
		}
	}
	
}
