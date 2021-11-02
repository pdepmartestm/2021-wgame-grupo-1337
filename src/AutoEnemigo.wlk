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
		jugador.perderVida(danio)
	}
	method doblar(){
		game.onTick(pantalla.velocidad() * 5, "GIRO_ENEMIGO", {
			const giro = (-1..1).anyOne()
			if((self.position().y() <= 4) && (self.fueraDeLimites(giro))){
			}
			else{
				self.position(game.at(self.position().x() + giro, self.position().y()))
			}
		})
		game.schedule(1000, {
			game.removeTickEvent("GIRO_ENEMIGO")
		})
	}
	
	method fueraDeLimites(giro){
		return (self.position().x()==0 && giro == -1) || (self.position().x()==5 && giro == 1)
	}
}
