import wollok.game.*
import AutoJugador.*
import Pantalla.*

object vida {
	const property position = game.at(4, 8)
	
	method image() = "BarraVida" + (autoJugador.vida()).min(5) + ".png"
	method colision(x){}
}
