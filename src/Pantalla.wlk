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
		
		//Spawn de items
		game.onTick(4000, "GENERAR", {
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
		})
		//Spawn de enemigos
		game.onTick(1500, "SPAWN_ENEMIGO", {
			const horizontal = (0..5).anyOne()
			const posicionSpawn = game.at(horizontal,8)
			const danio_imagen = [1, 2].anyOne()
			const b = new AutoEnemigo(danio = danio_imagen, position = posicionSpawn, number = danio_imagen - 1)
			game.addVisual(b)
			b.irCayendo()
			b.doblar()
		})
		
		//Auto del jugador
		game.addVisual(autoJugador)
		keyboard.left().onPressDo { 
			if(autoJugador.position().x()==0){//no hacer nada ya que se pasa de la pantalla
			}
			else{
				autoJugador.move(autoJugador.position().left(1))
				autoJugador.image("Auto_Izquierda.png")
				autoJugador.enderezar()
			}
		}
		keyboard.right().onPressDo { 
			if(autoJugador.position().x()>4){//no hacer nada ya que se pasa de la pantalla
			}
			else{
				autoJugador.move(autoJugador.position().right(1))
				autoJugador.image("Auto_Derecha.png")
				autoJugador.enderezar()
			}
		}
		
		//Manejo de colision con el auto
		game.onCollideDo(autoJugador, {
			entidad => entidad.colision(autoJugador)
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
	

}

