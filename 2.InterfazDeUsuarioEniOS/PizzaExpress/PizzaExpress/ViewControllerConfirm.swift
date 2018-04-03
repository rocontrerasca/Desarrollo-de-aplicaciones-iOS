//
//  ViewControllerConfirm.swift
//  PizzaExpress
//
//  Created by Richar on 2/05/17.
//  Copyright © 2017 devSoft. All rights reserved.
//

import UIKit

class ViewControllerConfirm: UIViewController {
    
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblCrust: UILabel!
    @IBOutlet weak var lblCheese: UILabel!
    @IBOutlet weak var lblIngredients: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    var pizzaSize = ""
    var pizzaCrust = ""
    var pizzaCheese = ""
    var pizzaIngredients = ""
    
    override func viewWillAppear(_ animated: Bool) {
        lblSize.text = pizzaSize
        lblCrust.text = pizzaCrust
        lblCheese.text = pizzaCheese
        lblIngredients.text = pizzaIngredients
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func confirmAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Confirmación", message: "¿Desea confirmar su pedido?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Si", style: .default, handler: { (action: UIAlertAction) -> Void in
            self.performSegue(withIdentifier: "cockingView", sender: self)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func resetOrder(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Borrar pedido", message: "Tu orden ha sido reiniciada", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
