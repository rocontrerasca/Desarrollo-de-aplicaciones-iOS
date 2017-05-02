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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView = segue.destinationViewController as! ViewControllerIngredients
        
        nextView.pizzaSize = pizzaSize
        nextView.pizzaCrust = pizzaCrust
        nextView.pizzaCheese = cheeseSelected
    }

    @IBAction func cheeseSelection(sender: UIButton) {
        cheeseSelected = sender.currentTitle!
        
        if cheeseSelected == "Mozarella"{
            mozarellaButton.selected = true
            chedarButton.selected = false
            parmesanoButton.selected = false
            noCheeseButton.selected = false
        }
        else if cheeseSelected == "Chedar"{
            mozarellaButton.selected = false
            chedarButton.selected = true
            parmesanoButton.selected = false
            noCheeseButton.selected = false
        }
        else if cheeseSelected == "Parmesano"{
            mozarellaButton.selected = false
            chedarButton.selected = false
            parmesanoButton.selected = true
            noCheeseButton.selected = false
        }
        else {
            mozarellaButton.selected = false
            chedarButton.selected = false
            parmesanoButton.selected = false
            noCheeseButton.selected = true
        }
        continueButton.hidden = false
    }
}
