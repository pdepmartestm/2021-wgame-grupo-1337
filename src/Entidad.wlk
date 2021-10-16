import wollok.game.*
class Entidad {
	
	var image
	var ultimoFrame = 0
	const animacion = [""]
	const cantidadFrame = animacion.size()
	var property position
	method siguienteFrame(){
		ultimoFrame = ultimoFrame + 1
		if(ultimoFrame == cantidadFrame) ultimoFrame = 0
		image =  animacion.get(ultimoFrame)
	}
	method image() {
		return image
	}
	
}
