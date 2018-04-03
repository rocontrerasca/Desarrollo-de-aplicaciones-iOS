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
    var ingredients = [15]
    var ingredientsSelected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView = segue.destination as! ViewControllerConfirm
        
        nextView.pizzaSize = pizzaSize
        nextView.pizzaCrust = pizzaCrust
        nextView.pizzaCheese = pizzaCheese
        if jamonButton.isSelected == true { nextView.pizzaIngredients += jamonButton.currentTitle! }
        if pavoButton.isSelected == true { nextView.pizzaIngredients += "\n" + pavoButton.currentTitle! }
        if salchichaButton.isSelected == true { nextView.pizzaIngredients += "\n" + salchichaButton.currentTitle! }
        if aceitunaButton.isSelected == true { nextView.pizzaIngredients += "\n" + aceitunaButton.currentTitle! }
        if cebollaButton.isSelected == true { nextView.pizzaIngredients += "\n" + cebollaButton.currentTitle! }
        if pepperoniButton.isSelected == true { nextView.pizzaIngredients += "\n" + pepperoniButton.currentTitle! }
        if pimientoButton.isSelected == true { nextView.pizzaIngredients += "\n" + pimientoButton.currentTitle! }
        if piñaButton.isSelected == true { nextView.pizzaIngredients += "\n" + piñaButton.currentTitle! }
        if anchoaButton.isSelected == true { nextView.pizzaIngredients += "\n" + anchoaButton.currentTitle! }
    }
    
    @IBAction func ingredientsSelection(_ sender: UIButton) {
        if sender.isSelected == true{
            if ingredientsSelected > 1{
                ingredientsSelected -= 1
                sender.isSelected = false
            }
        }
        else{
            if ingredientsSelected < 5{
                ingredientsSelected += 1
                sender.isSelected = true
            }
        }        
        continueButton.isHidden = false
    }
}
