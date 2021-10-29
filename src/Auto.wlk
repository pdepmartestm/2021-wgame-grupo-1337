import wollok.game.*
import Entidad.*

class Auto inherits Entidad{
	method modificar(auto){
		auto.vida(auto.vida() - 1)
	}
}

class Auto1 inherits Auto{
	override method image() = "auto_obs1.png"
}

class Auto2 inherits Auto{
	override method image() = "auto_obs2.png"
}
