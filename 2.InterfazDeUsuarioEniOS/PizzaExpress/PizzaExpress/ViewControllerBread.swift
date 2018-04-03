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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView = segue.destination as! ViewControllerCheese
        
        nextView.pizzaSize = pizzaSize
        nextView.pizzaCrust = crustTypeSelected
    }
    
    
    @IBAction func crustSelected(_ sender: UIButton) {
        crustTypeSelected = sender.currentTitle!
        
        if crustTypeSelected == "Delgada" {
            crustThinButton.isSelected = true
            crustCrunchyButton.isSelected = false
            crustGrossButton.isSelected = false
        }
        else if crustTypeSelected == "Crugiente" {
            crustThinButton.isSelected = false
            crustCrunchyButton.isSelected = true
            crustGrossButton.isSelected = false
        }
        else {
            crustThinButton.isSelected = false
            crustCrunchyButton.isSelected = false
            crustGrossButton.isSelected = true
        }
        continueButton.isHidden = false
    }
}
