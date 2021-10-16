import wollok.game.*
import Auto.*
class AutoJugador inherits Auto{
	
	var property vida
	
	method moverseDerecha(){ 
		position = position.right(1) 
	} 
	method moverseIzquierda(){ 
		position = position.left(1) 
	}
}
