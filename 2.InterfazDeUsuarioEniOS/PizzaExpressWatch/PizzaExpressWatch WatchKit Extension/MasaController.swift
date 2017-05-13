//
//  MasaController.swift
//  Ask4PizzaWatch
//
//  Created by Josman Pérez Expósito on 22/11/15.
//  Copyright © 2015 personal. All rights reserved.
//

import WatchKit
import Foundation

class MasaController: WKInterfaceController {
  
  let masaList:[(String,String)] = [("Elegida Delgada","Delgada"),("Elegida Crujiente","Crujiente"),("Elegida Gruesa","Gruesa")]
  
  var pickerItems:[WKPickerItem]?
  
  var resultado:[String]?
  var masaElegida = "Delgada"

  
  @IBOutlet var masaPicker: WKInterfacePicker!
  
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    
    // Configure interface objects here.
    
    resultado = context as? [String]
    if let contenidoAntes = resultado {
      print("elegidos")
      for index in contenidoAntes {
        print(index)
      }
    }
    
    
    pickerItems = masaList.map(){
      let pickerItem = WKPickerItem()
      pickerItem.title = $0.1
      pickerItem.caption = $0.0
      return pickerItem
    }
    
    masaPicker.setItems(pickerItems)
    
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
  @IBAction func selectedMasa(value: Int) {
    if (!resultado!.isEmpty) {
      resultado = resultado!.filter(){
        $0 != masaElegida
      }
    }

    let pickedItem = pickerItems![value]
    if pickedItem.title != nil {
      print(pickedItem.title!)
      masaElegida = pickedItem.title!
    }
  }
  
  @IBAction func btnMasa() {
    if (!resultado!.isEmpty) {
      resultado = resultado!.filter(){
        $0 != masaElegida
      }
    }
    resultado!.append(masaElegida)
    self.pushControllerWithName("masaSegue", context: resultado)
    
  }
  
}
