import wollok.game.*
import Entidad.*
import Pantalla.*
object autoJugador{
	
	var property image = "Auto_Derecho.png"
	var property position = game.at(3,0)
	var property vida = 5
	var property puntos = 0
	var property plata = 0
	
	method izquierda(){
		if(position.x()==0){//no hacer nada ya que se pasa de la pantalla
			}
			else{
				self.move(position.left(1))
				self.image("Auto_Izquierda.png")
				self.enderezar()
			}
	}
	
	method derecha(){
		if(position.x()>4){//no hacer nada ya que se pasa de la pantalla
			}
			else{
				self.move(position.right(1))
				self.image("Auto_Derecha.png")
				self.enderezar()
			}
	}
	
	method move(nuevaPosicion) {
		position = nuevaPosicion
	}
	
	method enderezar(){
		game.schedule(1 * 200, {self.image("Auto_Derecho.png")})
	}
	
	method perderVida(danioRecibido){
		self.vida(vida-danioRecibido)
		if(vida < 1){
			self.image("explosion.png")
			pantalla.perder()
		}
	}
	
	method aumentarVida(){
		if(vida < 5) vida = vida + 1
	}
}
