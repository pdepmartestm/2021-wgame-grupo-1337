import wollok.game.*
import AutoJugador.*
import Calle.*
import Arma.*
import Llave.*
import Dinero.*

object pantalla{
	
	var property velocidad = 100
	
	method iniciar(){
		game.title("GRA: Gran Robo Automotor")
		game.cellSize(100)
		game.boardGround("Calle1.png")
		game.height(9)
		game.width(6)
		game.addVisual(calle)
		calle.animacion()
		
		keyboard.up().onPressDo {
			velocidad = velocidad - 20
			game.removeTickEvent("Animacion Fondo")
			calle.animacion()
		}
		keyboard.down().onPressDo {
			velocidad = velocidad + 20
			game.removeTickEvent("Animacion Fondo")
			calle.animacion()
		}
	
		var autoJugador = new AutoJugador(vida = 100, image = "Auto_Derecho.png", position = game.at(0, 0))
		game.addVisual(autoJugador)
		game.showAttributes(autoJugador)
		keyboard.left().onPressDo { 
			autoJugador.move(autoJugador.position().left(1))
			autoJugador.image("Auto_Izquierda.png")
			autoJugador.enderezar()
		}
		keyboard.right().onPressDo { 
			autoJugador.move(autoJugador.position().right(1))
			autoJugador.image("Auto_Derecha.png")
			autoJugador.enderezar()
		}
		
		game.onTick(4 * 1000, "GENERAR", {
			const random = (1..6).anyOne()
			const horizontal = (0..5).anyOne()
			const posicionSpawn = game.at(horizontal,8)
			var b
			if(random == 1) b = new Bate(position = posicionSpawn)
			if(random == 2) b = new Espada(position = posicionSpawn)
			if(random == 3) b = new Pistola(position = posicionSpawn)
			if(random == 4) b = new Ametralladora(position = posicionSpawn)
			if(random == 5) b = new Llave(position = posicionSpawn)
			if(random == 6) b = new Dinero(position = posicionSpawn)
			
			game.addVisual(b)
			b.irCayendo()	
			game.onTick(1000, "AGARRAR", {
				if(autoJugador.position() == b.position()) b.modificar(autoJugador)
			})
		})

		game.start()
	}

	
}

