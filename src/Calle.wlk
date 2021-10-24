//Ya que la calle será el fondo, simplemente se usa un objeto para darle el movimiento requerido
import wollok.game.*
import Pantalla.*
object calle{
	
	var property nro = 1
	var property velocidadCalle = pantalla.velocidad()
	
	method image(){
		return "Calle" + nro + ".png"
	}
	
	method position(){
		return game.origin()
	}
	
	method animacion(){
		game.onTick(velocidadCalle, "Animacion Fondo", {nro = (nro % 2) + 1 })
	}

}
