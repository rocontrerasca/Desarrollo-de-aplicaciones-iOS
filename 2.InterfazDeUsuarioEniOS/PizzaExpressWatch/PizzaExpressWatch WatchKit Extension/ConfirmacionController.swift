//
//  ConfirmacionSegue.swift
//  Ask4PizzaWatch
//
//  Created by Josman Pérez Expósito on 22/11/15.
//  Copyright © 2015 personal. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmacionController: WKInterfaceController {
  
  var resultado:[String]?
  
  @IBOutlet var resultadoLabel: WKInterfaceLabel!
  
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    
    resultado = context as? [String]
    if let contenidoAntes = resultado {
      print("elegidos:")
      var texto:String = "Elegidos: "
      for index in contenidoAntes {
        texto += "\(index) "
        print(index)
      }
      resultadoLabel.setText(texto)
    }
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
}
