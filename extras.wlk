import wollok.game.*
import pepita.*

object nido{
    const property position = game.at(7, 8)

    method image() = "nido.png"

    method saludo() = "Bienvenido a casa"

    //method pepitaEstaEnLaCasa() = game.say(self, self.saludo())

}

object silvestre{
    const presa = pepita

    method image() = "silvestre.png"

    method position() = game.at(self.x(), 0)

    method x() = 3.max(presa.position().x()) //presa.position().x().max(3)
    //if(presa.position().x() >= 3) { presa.position().x()} else { 3 }

    method atrapada() = "Gotcha!"

}



