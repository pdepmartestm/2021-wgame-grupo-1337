import wollok.game.*
import Entidad.*
import Pantalla.*

class AutoEnemigo inherits Entidad{
	//Hará un choque
	
	const danio
	const imagenes = ["auto_obs1.png", "auto_obs2.png"]
	const number
	override method image() = imagenes.get(number)
	override method colision(jugador){
		game.sound("sonidoChoque.mp3").play()
		jugador.vida(jugador.vida()-danio)
		if(jugador.vida()<1){
			const sonidoExplosion = game.sound("sonidoExplosion.mp3")
			sonidoExplosion.play()
			jugador.image("explosion.png")
			game.removeTickEvent("SPAWN_ENEMIGO")
			game.removeTickEvent("GENERAR")
			game.removeTickEvent("Animacion Fondo")
			game.schedule(1000, {
				pantalla.terminarPartida("cartel_perdiste.png", "e27b7b")
			})
		}
	}
	
}
