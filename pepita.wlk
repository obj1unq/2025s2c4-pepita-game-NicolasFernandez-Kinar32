import comidas.*
import wollok.game.*
import extras.*
import direcciones.*
import niveles.*

object pepita {
	const posicionInicial = game.at(0,1)
	var property position = posicionInicial //
	const energiaInicial = 100
	var energia = energiaInicial
	const cazador = silvestre
	const casa = nido
	var atrapada = false
	
method inicializar(){
	position = game.at(0,1)
	energia = energiaInicial
	atrapada = false
}

	method image(){
		return "pepita-" + self.estado() + ".png"
	}

	method estado(){
		return if (atrapada || !self.puedeMover()){"gris"}
		else if (self.estaSobre(casa)){"grande"}
		else {"base"}
	}

	method puedeMover() = energia >= self.energiaNecesaria(1) && !self.estaSobre(cazador)

	method teAtraparon(){
		game.say(self, "Aaah, me atraparon")
		self.perder()
	}

	method estaSobre(alguien) = position == alguien.position()
	
	method text() = "Energia: \n" + energia

	method textColor() = "FF0000"

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method comerAca(){
		try{
			const comida = self.loQueHayAca()
			self.comer(comida)
			comida.consumida()

		} catch e: Exception{
			game.say(self, "No hay nada aca")  //console.println("")
		}

	}

	method loQueHayAca() = game.uniqueCollider(self)

	method energiaNecesaria(kms) = 9 * kms


	method volar(kms) {
		energia = energia - self.energiaNecesaria(kms) 
	}
	
	method energia() {
		return energia
	}

	method mover(direccion){
		if(self.puedeMover()){
			self.volar(1)
			position = direccion.siguiente(position)
		} else{
			self.perder()
		}
	}

	method perder(){
		game.say(self, "Perdi!")
		game.schedule(2000, {game.stop()})
	}


	//method volarArriba(){
	//	self.volar(1)
	//	position = position.up(1)
	//}

	method redibujarse(){
	  game.removeVisual(self)
	  game.addVisual(self)
	}

	method encontraste(algo){
		algo.queHagoConVos(self)
	}

	method ganaste(){
		game.say(self, "ganaste")
	}

/*
pensarlo como moverSiPuedeDerecha, izquierda, etc

	method moverSiPuede(direccion){
		const lastKnowPosition = self.position()
		if(self.position().x().between(1, 9) && self.position().y().between(1, 9)){
			self.mover(direccion)
		} else{
			position = lastKnowPosition
		}
	}
*/
	method greetings() = "It's Pepita time!"
}
