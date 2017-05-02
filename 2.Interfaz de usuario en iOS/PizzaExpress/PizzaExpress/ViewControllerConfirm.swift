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

}
