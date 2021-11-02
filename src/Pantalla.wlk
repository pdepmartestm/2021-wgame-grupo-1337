import wollok.game.*
import AutoJugador.*
import Calle.*
import Arma.*
import Llave.*
import Dinero.*
import AutoEnemigo.*
import Vida.*
import Puntaje.*
import timer.*

object pantalla{
	
	var property velocidad = 100
	
	method iniciar(){
		game.title("GRA: Gran Robo Automotor")
		game.cellSize(100)
		game.boardGround("Calle1.png")
		game.height(9)
		game.width(6)
		//Musica de fondo
		const musicaFondo = game.sound("musicaFondo.mp3")
		musicaFondo.shouldLoop(true)
		game.schedule(100, {musicaFondo.play()})
		//Setup calle
		game.addVisual(calle)
		calle.animacion()
		
		keyboard.up().onPressDo {
			velocidad = velocidad - 10
			self.nuevaVelocidadAnimacion()
		}
		keyboard.down().onPressDo {
			velocidad = velocidad + 10
			self.nuevaVelocidadAnimacion()
		}
		
		self.spawnDeItems()
		self.spawnDeEnemigos()
		
		//Auto del jugador
		game.addVisual(autoJugador)
		keyboard.left().onPressDo { autoJugador.izquierda()	}
		keyboard.right().onPressDo{ autoJugador.derecha()	}
		
		//Manejo de colision con el auto
		game.onCollideDo(autoJugador, {
			entidad => entidad.colision(autoJugador)
			if(autoJugador.puntos() > 500){
				musicaFondo.stop()
				self.terminarPartida("cartel_ganaste.png", "a2e27b")
				game.sound("musicaVictoria.mp3").play()
			}
		})
		
		//visual de puntaje del auto
		game.addVisual(puntaje)
		//visual temporizador
		game.addVisual(timer)
		timer.cuentaRegresiva()
		//Visual de la vida
		game.addVisual(vida)
		game.start()
	}
	
	method nuevaVelocidadAnimacion(){
		game.removeTickEvent("Animacion Fondo")
		calle.velocidadCalle(velocidad)
		calle.animacion()
	}
	
	method terminarPartida(imagenFinalizacion, color){
		game.clear()
		game.schedule(4000, {
			game.stop()
		})
		game.addVisual(object { 
			var property position = game.at(0, 0)
			method image() = imagenFinalizacion
		})
		puntaje.color(color)
		game.addVisual(puntaje)
	}
	
	method puntajeBaseVelocidad() = 200 - velocidad
	
	method items(posicionSpawn) = [new Bate(position = posicionSpawn), new Espada(position = posicionSpawn), new Ametralladora(position = posicionSpawn), new Llave(position = posicionSpawn), new Dinero(position = posicionSpawn)]
	
	method spawnDeItems(){
		game.onTick(4000, "GENERAR", {
			const horizontal = (0..5).anyOne()
			const posicionSpawn = game.at(horizontal,8)
			const item = self.items(posicionSpawn).anyOne()
			game.addVisual(item)
			item.irCayendo()	
		})
	}
	
	method spawnDeEnemigos(){
		game.onTick(1500, "SPAWN_ENEMIGO", {
			const horizontal = (0..5).anyOne()
			const posicionSpawn = game.at(horizontal,8)
			const danio_imagen = [1, 2].anyOne()
			const b = new AutoEnemigo(danio = danio_imagen, position = posicionSpawn, number = danio_imagen - 1)
			game.addVisual(b)
			b.irCayendo()
			b.doblar()
		})
	}
	
	method perder(){
		const sonidoExplosion = game.sound("sonidoExplosion.mp3")
		sonidoExplosion.play()
		game.removeTickEvent("SPAWN_ENEMIGO")
		game.removeTickEvent("GENERAR")
		game.removeTickEvent("Animacion Fondo")
		game.schedule(1000, {
			self.terminarPartida("cartel_perdiste.png", "e27b7b")
		})
	}

}

