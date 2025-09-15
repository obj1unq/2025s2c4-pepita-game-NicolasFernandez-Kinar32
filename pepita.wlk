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
	
method inicializar(){
	position = game.at(0,1)
	energia = energiaInicial
}

	method image(){
		return "pepita-" + self.estado() + ".png"
	}

	method estado(){
		return if (self.estaSobre(cazador) || !self.puedeMover()){"gris"}
		else if (self.estaSobre(casa)){"grande"}
		else {"base"}
	}

	method puedeMover() = energia >= self.energiaNecesaria(1)

	method estaSobre(alguien) = position == alguien.position()
	
	method text() = "Energia: \n" + energia

	method textColor() = "FF0000"

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method comerAca(){
		const comida = self.loQueHayAca()
		self.comer(comida)
		comida.consumida()
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
		keyboard.r().onPressDo{
			game.clear()
			self.inicializar()
			nivel1.inicializar()
		}
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

	method greetings() = "It's Pepita time!"

}
