//
//  QuesoController.swift
//  Ask4PizzaWatch
//
//  Created by Josman Pérez Expósito on 22/11/15.
//  Copyright © 2015 personal. All rights reserved.
//

import WatchKit
import Foundation


class QuesoController: WKInterfaceController {
  
  let quesoList:[(String,String)] = [("Elegido Mozarela","Morazela"),("Elegido Cheddar","Cheddar"),("Elegido Parmesano","Parmesano"),("Elegido sin queso","Sin Queso")]
  
  var pickerItems:[WKPickerItem]?
  
  var resultado:[String]?
  var quesoElegido = "Mozarela"
  
  @IBOutlet var quesoPicker: WKInterfacePicker!
  
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    
    resultado = context as? [String]
    if let contenidoAntes = resultado {
      print("elegidos:")
      for index in contenidoAntes {
        print(index)
      }
    }
    
    pickerItems = quesoList.map(){
      let pickerItem = WKPickerItem()
      pickerItem.title = $0.1
      pickerItem.caption = $0.0
      return pickerItem
    }
    
    quesoPicker.setItems(pickerItems)
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
  @IBAction func quesoSelected(value: Int) {
    if (!resultado!.isEmpty) {
      resultado = resultado!.filter(){
        $0 != quesoElegido
      }
    }

    let pickedItem = pickerItems![value]
    if pickedItem.title != nil {
      print(pickedItem.title!)
      quesoElegido = pickedItem.title!
    }
  }
  @IBAction func btnQueso() {
    if (!resultado!.isEmpty) {
      resultado = resultado!.filter(){
        $0 != quesoElegido
      }
    }

    resultado!.append(quesoElegido)
    pushControllerWithName("quesoSegue", context: resultado)
  }
}
