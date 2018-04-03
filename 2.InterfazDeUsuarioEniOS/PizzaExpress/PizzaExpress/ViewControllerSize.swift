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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView = segue.destination as! ViewControllerBread
        
        nextView.pizzaSize = sizeSelected
    }
    
    @IBAction func sizeSelection(_ sender: UIButton) {
        sizeSelected = sender.currentTitle!
        
        if sizeSelected == "Chica" {
            sizeMediumButton.isSelected = false
            sizeSmallButton.isSelected = true
            sizeLargeButton.isSelected = false
        }
        else if sizeSelected == "Mediana" {
            sizeMediumButton.isSelected = true
            sizeSmallButton.isSelected = false
            sizeLargeButton.isSelected = false
        }
        else{
                sizeMediumButton.isSelected = false
                sizeSmallButton.isSelected = false
                sizeLargeButton.isSelected = true
        }        
        continueButton.isHidden = false
    }
}
