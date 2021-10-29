import wollok.game.*
import Entidad.*
import Pantalla.*

class AutoEnemigo inherits Entidad{
	//Hará un choque
	
	const danio
	override method image() ="enemigo_Derecho.png"
	override method colision(jugador){
		const sonidoChoque = game.sound("sonidoChoque.mp3")
		jugador.vida(jugador.vida()-danio)
		game.schedule(50, {sonidoChoque.play()})
		if(jugador.vida()<0){
			const sonidoExplosion = game.sound("sonidoExplosion.mp3")
			game.schedule(150, {sonidoExplosion.play()})
			jugador.image("explosion.png")
			game.removeTickEvent("SPAWN_ENEMIGO")
			game.removeTickEvent("GENERAR")
			game.removeTickEvent("Animacion Fondo")
			game.say(jugador, "PERDISTE")
			game.schedule(2000, {
				game.stop()
			})
		}
	}
	
}
