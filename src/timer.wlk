import wollok.game.*
import AutoJugador.*
import Pantalla.*
object timer {
	const property position = game.at(5, 6)
	var tiempo = 90
	
	method text(){
		return "Tiempo: " + tiempo.toString()
	}
	
	method textColor() = "39ff14"
	method colision(x){}
	method cuentaRegresiva(){
		game.onTick(1000, "temporizador", {
			tiempo = tiempo - 1
			if(tiempo == 0){
				pantalla.terminarPartida("cartel_ganaste.png", "a2e27b")
			}
		})
	}
	
}
