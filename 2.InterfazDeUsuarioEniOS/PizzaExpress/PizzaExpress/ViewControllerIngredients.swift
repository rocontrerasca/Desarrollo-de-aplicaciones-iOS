//
//  ViewControllerIngredients.swift
//  PizzaExpress
//
//  Created by Richar on 2/05/17.
//  Copyright © 2017 devSoft. All rights reserved.
//

import UIKit

class ViewControllerIngredients: UIViewController {
    
    @IBOutlet weak var jamonButton: UIButton!
    @IBOutlet weak var pavoButton: UIButton!
    @IBOutlet weak var salchichaButton: UIButton!
    @IBOutlet weak var aceitunaButton: UIButton!
    @IBOutlet weak var cebollaButton: UIButton!
    @IBOutlet weak var pimientoButton: UIButton!
    @IBOutlet weak var piñaButton: UIButton!
    @IBOutlet weak var anchoaButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var pepperoniButton: UIButton!
    
    
    var pizzaSize = ""
    var pizzaCrust = ""
    var pizzaCheese = ""
    var ingredients = []
    var ingredientsSelected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView = segue.destinationViewController as! ViewControllerConfirm
        
        nextView.pizzaSize = pizzaSize
        nextView.pizzaCrust = pizzaCrust
        nextView.pizzaCheese = pizzaCheese
        if jamonButton.selected == true { nextView.pizzaIngredients += jamonButton.currentTitle! }
        if pavoButton.selected == true { nextView.pizzaIngredients += " " + pavoButton.currentTitle! }
        if salchichaButton.selected == true { nextView.pizzaIngredients += " " + salchichaButton.currentTitle! }
        if aceitunaButton.selected == true { nextView.pizzaIngredients += " " + aceitunaButton.currentTitle! }
        if cebollaButton.selected == true { nextView.pizzaIngredients += " " + cebollaButton.currentTitle! }
        if pepperoniButton.selected == true { nextView.pizzaIngredients += " " + pepperoniButton.currentTitle! }
        if pimientoButton.selected == true { nextView.pizzaIngredients += " " + pimientoButton.currentTitle! }
        if piñaButton.selected == true { nextView.pizzaIngredients += " " + piñaButton.currentTitle! }
        if anchoaButton.selected == true { nextView.pizzaIngredients += " " + anchoaButton.currentTitle! }
    }
    
    @IBAction func ingredientsSelection(sender: UIButton) {
        if sender.selected == true{
            if ingredientsSelected > 1{
                ingredientsSelected -= 1
                sender.selected = false
            }
        }
        else{
            if ingredientsSelected < 5{
                ingredientsSelected += 1
                sender.selected = true
            }
        }        
        continueButton.hidden = false
    }
}
