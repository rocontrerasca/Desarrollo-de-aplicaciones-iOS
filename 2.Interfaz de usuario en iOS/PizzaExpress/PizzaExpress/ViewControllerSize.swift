//
//  ViewControllerSize.swift
//  PizzaExpress
//
//  Created by Richar on 1/05/17.
//  Copyright © 2017 devSoft. All rights reserved.
//

import UIKit

class ViewControllerSize: UIViewController {
    
    @IBOutlet weak var sizeSmallButton: UIButton!
    @IBOutlet weak var sizeMediumButton: UIButton!
    @IBOutlet weak var sizeLargeButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    var sizeSelected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView = segue.destinationViewController as! ViewControllerBread
        
        nextView.pizzaSize = sizeSelected
    }
    
    @IBAction func sizeSelection(sender: UIButton) {
        sizeSelected = sender.currentTitle!
        
        if sizeSelected == "Chica" {
            sizeMediumButton.selected = false
            sizeSmallButton.selected = true
            sizeLargeButton.selected = false
        }
        else if sizeSelected == "Mediana" {
            sizeMediumButton.selected = true
            sizeSmallButton.selected = false
            sizeLargeButton.selected = false
        }
        else{
                sizeMediumButton.selected = false
                sizeSmallButton.selected = false
                sizeLargeButton.selected = true
        }        
        continueButton.hidden = false
    }
}
