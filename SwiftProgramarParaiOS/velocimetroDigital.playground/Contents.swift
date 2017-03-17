//: Playground - noun: a place where people can play
import UIKit

enum Velocidades: Int{
    case apagado = 0
    case velocidadBaja = 20
    case velocidadMedia = 50
    case velocidadAlta = 120
    
    init ( velocidadInicial : Velocidades) {
        self = velocidadInicial
    }
}

class Auto {
    var velocidad: Velocidades
    required init(){
        self.velocidad = Velocidades.init(velocidadInicial: Velocidades.apagado)
    }
    
    func cambioDeVelocidad() -> (actual : Int, velocidadEnCadena: String){
        var resultado = (Velocidades.apagado.rawValue,"Apagado")
        switch self.velocidad {
        case Velocidades.apagado:
            resultado = (self.velocidad.rawValue,"Apagado")
            self.velocidad = Velocidades.velocidadBaja
        case Velocidades.velocidadBaja:
            resultado = (self.velocidad.rawValue,"Velocidad Baja")
            self.velocidad = Velocidades.velocidadMedia
        case Velocidades.velocidadMedia:
            resultado = (self.velocidad.rawValue,"Velocidad Media")
            self.velocidad = Velocidades.velocidadAlta
        case Velocidades.velocidadAlta:
            resultado = (self.velocidad.rawValue,"Velocidad Alta")
            self.velocidad = Velocidades.velocidadMedia
        default:
            resultado = (Velocidades.apagado.rawValue,"Apagado")
        }
        return resultado
    }
}

var auto = Auto()

for i in 0..<20{
    var (velocidad, velocidadEnCadena) = auto.cambioDeVelocidad()
    print("\(velocidad), \(velocidadEnCadena)")    
}



