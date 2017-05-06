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
    
    override func viewWillAppear(animated: Bool) {
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

    @IBAction func confirmAction(sender: UIButton) {
        
        let alert = UIAlertController(title: "Confirmación", message: "¿Desea confirmar su pedido?", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "Si", style: .Default, handler: { (action: UIAlertAction) -> Void in
            self.performSegueWithIdentifier("cockingView", sender: self)
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func resetOrder(sender: UIButton) {
        
        let alert = UIAlertController(title: "Borrar pedido", message: "Tu orden ha sido reiniciada", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "Cerrar", style: .Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
