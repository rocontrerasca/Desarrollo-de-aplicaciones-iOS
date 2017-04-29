//
//  Datos.swift
//  HamburguesasEnElMundo
//
//  Created by Richar on 25/03/17.
//  Copyright © 2017 Richar. All rights reserved.
//

import Foundation
import UIKit

class Colores {
    let colores = [ UIColor(red:210/255.0, green: 90/255.0, blue: 45/255.0, alpha: 1),
                    UIColor(red:40/255.0, green: 170/255.0, blue: 45/255.0, alpha: 1),
                    UIColor(red:3/255.0, green: 180/255.0, blue: 90/255.0, alpha: 1),
                    UIColor(red:210/255.0, green: 190/255.0, blue: 5/255.0, alpha: 1),
                    UIColor(red:120/255.0, green: 120/255.0, blue: 50/255.0, alpha: 1),
                    UIColor(red:130/255.0, green: 80/255.0, blue: 90/255.0, alpha: 1),
                    UIColor(red:130/255.0, green: 130/255.0, blue: 130/255.0, alpha: 1),
                    UIColor(red:10/255.0, green: 160/255.0, blue: 70/255.0, alpha: 1),
                    UIColor(red:13/255.0, green: 110/255.0, blue: 200/255.0, alpha: 1),
                    UIColor(red:125/255.0, green: 60/255.0, blue: 120/255.0, alpha: 1),
                    UIColor(red:180/255.0, green: 70/255.0, blue: 210/255.0, alpha: 1),
                    UIColor(red:175/255.0, green: 50/255.0, blue: 190/255.0, alpha: 1),
                    UIColor(red:205/255.0, green: 30/255.0, blue: 30/255.0, alpha: 1),
                    UIColor(red:225/255.0, green: 120/255.0, blue: 28/255.0, alpha: 1),
                    UIColor(red:195/255.0, green: 130/255.0, blue: 15/255.0, alpha: 1),
                    UIColor(red:75/255.0, green: 140/255.0, blue: 9/255.0, alpha: 1),
                    UIColor(red:55/255.0, green: 150/255.0, blue: 50/255.0, alpha: 1),
                    UIColor(red:45/255.0, green: 180/255.0, blue: 45/255.0, alpha: 1),
                    UIColor(red:150/255.0, green: 195/255.0, blue: 15/255.0, alpha: 1),
                    UIColor(red:30/255.0, green: 220/255.0, blue: 10/255.0, alpha: 1)
                    ]

    func RegresaColorAletaorio() -> UIColor {
        let posicion = Int( arc4random()) % colores.count
        return colores[posicion]
    }
}

class Paises {
    let paises = ["Barbados", "Bolivia", "Brazil", "Camerun", "Canada", "Chile", "China", "Colombia", "Congo", "Costa Rica",
                  "Ecuador", "Egipto", "El Salvador", "Francia", "Alemania",  "Grecia", "Guatemala",  "Haiti", "Honduras", "Mexico"]
    
    func RegresaPaisAletorio() -> String {
        let posicion = Int( arc4random()) % paises.count
        return paises[posicion]
    }
}

class Hamburguesas {
    let hamburguesas = ["La sencilla", "The Ranch Burger", "Bacon Cheese Burger", "Ugly American", "Angus Young", "La Costeña", "La Indigo Encebollada", "La Hamburguesa Con Chili", "La Super Kaplan",          "La de Cordero", "La Big Boy", "Gordo Brooklyn", "La Doble", "La Garosa", "La Solo Carne", "Whopper Jr",  "La Casera", "A La Mexicana","La Todo Terreno", "La Colombiana"]
    
    let precios = ["$15.000", "$25.000", "$20.000", "$40.000", "$28.000", "$17.000", "$22.000", "$15.800", "$21.300", "$18.050",
                   "$14.999", "$19.700", "$23.100", "$22.800", "$27.550", "$24.350", "$25.750", "$20.500", "$27.150", "$16.700"]
    
    func RegresaHamburguesaPrecioAletorio() -> (hamburguesa: String, precio: String) {
        let posicion = Int( arc4random()) % hamburguesas.count
        return (hamburguesas[posicion], precios[posicion])
    }
}

