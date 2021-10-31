import wollok.game.*
import AutoJugador.*
import Pantalla.*

object puntaje {
	
	const property position = game.at(5, 7)
	var property color = "39ff14"
	
	method text(){
		return "Puntaje: " + autoJugador.puntos().toString()
	}
	method textColor() = color
	method colision(x){}
	
}
