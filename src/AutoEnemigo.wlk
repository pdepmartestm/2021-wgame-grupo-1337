import wollok.game.*
import Entidad.*

class AutoEnemigo inherits Entidad{
	//Hará un choque
	
	const danio
	override method image() ="enemigo_Derecho.png"
	override method colision(jugador){
		jugador.vida(jugador.vida()-danio)
		if(jugador.vida()<0){
			jugador.image("explosion.png")
			game.removeTickEvent("SPAWN_ENEMIGO")
			game.removeTickEvent("GENERAR")
			game.removeTickEvent("Animacion Fondo")
			game.say(jugador, "PERDISTE")
			game.schedule(1000, {
				game.stop()
			})
		}
	}
	
}
