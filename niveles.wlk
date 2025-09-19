import wollok.game.*
import direcciones.*
import pepita.*
import extras.*
import comidas.*

object nivel1{
	method inicializar(){
		game.addVisual(nido)
		game.addVisual(silvestre)

		game.addVisual(manzana)
		game.addVisual(alpiste)

		game.addVisual(pepita)
		game.say(pepita, pepita.greetings())

		game.onTick(800, "caida", {pepita.gravedad()})

		keyboard.up().onPressDo		({if(pepita.position().y()<9){pepita.mover(arriba)}})
		keyboard.down().onPressDo	({if(pepita.position().y()>=1){pepita.mover(abajo)}})
		keyboard.right().onPressDo	({if(pepita.position().x()<9)pepita.mover(derecha)})
		keyboard.left().onPressDo	({if(pepita.position().x()>=1)pepita.mover(izquierda)})
		//keyboard.c().onPressDo		({pepita.comerAca()})
		keyboard.r().onPressDo({game.clear()
								self.inicializar()
								pepita.inicializar()})

        game.onCollideDo(pepita, {algo => pepita.encontraste(algo)})

	}
}