//
//  ViewControllerBread.swift
//  PizzaExpress
//
//  Created by Richar on 2/05/17.
//  Copyright © 2017 devSoft. All rights reserved.
//

import UIKit

class ViewControllerBread: UIViewController {
    
    @IBOutlet weak var crustThinButton: UIButton!
    @IBOutlet weak var crustCrunchyButton: UIButton!
    @IBOutlet weak var crustGrossButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    var pizzaSize = ""
    var crustTypeSelected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView = segue.destinationViewController as! ViewControllerCheese
        
        nextView.pizzaSize = pizzaSize
        nextView.pizzaCrust = crustTypeSelected
    }
    
    
    @IBAction func crustSelected(sender: UIButton) {
        crustTypeSelected = sender.currentTitle!
        
        if crustTypeSelected == "Delgada" {
            crustThinButton.selected = true
            crustCrunchyButton.selected = false
            crustGrossButton.selected = false
        }
        else if crustTypeSelected == "Crugiente" {
            crustThinButton.selected = false
            crustCrunchyButton.selected = true
            crustGrossButton.selected = false
        }
        else {
            crustThinButton.selected = false
            crustCrunchyButton.selected = false
            crustGrossButton.selected = true
        }
        continueButton.hidden = false
    }
}
