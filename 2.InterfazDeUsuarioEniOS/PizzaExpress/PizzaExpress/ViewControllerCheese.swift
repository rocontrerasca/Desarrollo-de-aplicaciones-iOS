//
//  ViewControllerCheese.swift
//  PizzaExpress
//
//  Created by Richar on 2/05/17.
//  Copyright © 2017 devSoft. All rights reserved.
//

import UIKit

class ViewControllerCheese: UIViewController {
    
    @IBOutlet weak var noCheeseButton: UIButton!
    @IBOutlet weak var mozarellaButton: UIButton!
    @IBOutlet weak var chedarButton: UIButton!
    @IBOutlet weak var parmesanoButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    var pizzaSize = ""
    var pizzaCrust = ""
    var cheeseSelected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView = segue.destination as! ViewControllerIngredients
        
        nextView.pizzaSize = pizzaSize
        nextView.pizzaCrust = pizzaCrust
        nextView.pizzaCheese = cheeseSelected
    }

    @IBAction func cheeseSelection(_ sender: UIButton) {
        cheeseSelected = sender.currentTitle!
        
        if cheeseSelected == "Mozarella"{
            mozarellaButton.isSelected = true
            chedarButton.isSelected = false
            parmesanoButton.isSelected = false
            noCheeseButton.isSelected = false
        }
        else if cheeseSelected == "Chedar"{
            mozarellaButton.isSelected = false
            chedarButton.isSelected = true
            parmesanoButton.isSelected = false
            noCheeseButton.isSelected = false
        }
        else if cheeseSelected == "Parmesano"{
            mozarellaButton.isSelected = false
            chedarButton.isSelected = false
            parmesanoButton.isSelected = true
            noCheeseButton.isSelected = false
        }
        else {
            mozarellaButton.isSelected = false
            chedarButton.isSelected = false
            parmesanoButton.isSelected = false
            noCheeseButton.isSelected = true
        }
        continueButton.isHidden = false
    }
}
