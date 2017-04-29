//
//  ViewController.swift
//  HamburguesasEnElMundo
//
//  Created by Richar on 25/03/17.
//  Copyright © 2017 Richar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblPais: UILabel!
    @IBOutlet weak var lblHamburguesa: UILabel!
    @IBOutlet weak var lblHamburguesaPrecio: UILabel!
    
    let colores = Colores()
    let paises = Paises()
    let hamburguesas = Hamburguesas()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func QueroHamburguesa() {
        let hamburguesaPrecio = hamburguesas.RegresaHamburguesaPrecioAletorio()
        lblPais.text = paises.RegresaPaisAletorio()
        lblHamburguesa.text = hamburguesaPrecio.hamburguesa
        lblHamburguesaPrecio.text = hamburguesaPrecio.precio
        view.backgroundColor = colores.RegresaColorAletaorio()
    }
}

