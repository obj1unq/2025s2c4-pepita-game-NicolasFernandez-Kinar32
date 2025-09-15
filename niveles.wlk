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

		keyboard.up().onPressDo({pepita.mover(arriba)})         //se pueden sacar los parentesis
		keyboard.down().onPressDo({pepita.mover(abajo)})
		keyboard.right().onPressDo({pepita.mover(derecha)})
		keyboard.left().onPressDo({pepita.mover(izquierda)})
		keyboard.c().onPressDo({pepita.comerAca()})

		game.say(pepita, pepita.greetings())
	}
}