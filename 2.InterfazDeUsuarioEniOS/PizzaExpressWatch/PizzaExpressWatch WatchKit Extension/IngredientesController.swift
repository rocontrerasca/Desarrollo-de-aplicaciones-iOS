//
//  IngredientesController.swift
//  Ask4PizzaWatch
//
//  Created by Josman Pérez Expósito on 22/11/15.
//  Copyright © 2015 personal. All rights reserved.
//

import WatchKit
import Foundation


class IngredientesController: WKInterfaceController {
  
  var resultado:[String]?
  
  var ingredientes:[String] = []
    
  var ingredientesCantidad = 0
  
  @IBOutlet var btnSiguiente: WKInterfaceButton!
    
    
    @IBOutlet var IPiña: WKInterfaceSwitch!
    @IBOutlet var ICebolla: WKInterfaceSwitch!
    @IBOutlet var IAceituna: WKInterfaceSwitch!
    @IBOutlet var IPimiento: WKInterfaceSwitch!
    @IBOutlet var ISalchicha: WKInterfaceSwitch!
    @IBOutlet var IPavo: WKInterfaceSwitch!
    @IBOutlet var IPepperoni: WKInterfaceSwitch!
    @IBOutlet var IJamon: WKInterfaceSwitch!
  
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    
    resultado = context as? [String]
    if let contenidoAntes = resultado {
      print("elegidos:")
      for index in contenidoAntes {
        print(index)
      }
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
  
  @IBAction func jamon(value: Bool) {
    if(value){
      ingredientes.append("Jamon")
      resultado!.append("Jamon")
        ingredientesCantidad += 1
    }else{
      ingredientes = ingredientes.filter(){ $0 != "Jamon"}
      resultado! = resultado!.filter(){ $0 != "Jamon"}
        ingredientesCantidad -= 1
    }
        print(ingredientesCantidad)
    
    habilitarBoton()
  }
  
  @IBAction func pepperoni(value: Bool) {
    
        if(value){
            ingredientes.append("Pepperoni")
            resultado!.append("Pepperoni")
            ingredientesCantidad += 1
        }else{
            ingredientes = ingredientes.filter(){ $0 != "Pepperoni"}
            resultado! = resultado!.filter(){ $0 != "Pepperoni"}
            ingredientesCantidad -= 1
        }
        print(ingredientesCantidad)
    
    habilitarBoton()
  }
  
  @IBAction func pavo(value: Bool) {
    if ingredientesCantidad > 5 {
    }
    else{
        if(value){
            ingredientes.append("Pavo")
            resultado!.append("Pavo")
            ingredientesCantidad += 1
            
        }else{
            ingredientes = ingredientes.filter(){ $0 != "Pavo"}
            resultado! = resultado!.filter(){ $0 != "Pavo"}
            ingredientesCantidad -= 1
        }
        print(ingredientesCantidad)
    }
    habilitarBoton()
  }
  
  @IBAction func salchicha(value: Bool) {
    
        if(value){
            ingredientes.append("Salchicha")
            resultado!.append("Salchicha")
            ingredientesCantidad += 1
        }else{
            ingredientes = ingredientes.filter(){ $0 != "Salchicha"}
            resultado! = resultado!.filter(){ $0 != "Salchicha"}
            ingredientesCantidad -= 1
        }
        print(ingredientesCantidad)
    habilitarBoton()
  }
  
  @IBAction func aceituna(value: Bool) {
    
        if(value){
            ingredientes.append("Aceituna")
            resultado!.append("Aceituna")
            ingredientesCantidad += 1
        }else{
            ingredientes = ingredientes.filter(){ $0 != "Aceituna"}
            resultado! = resultado!.filter(){ $0 != "Aceituna"}
            ingredientesCantidad -= 1
        }
        print(ingredientesCantidad)
    habilitarBoton()
  }
  
  @IBAction func pina(value: Bool) {

        if(value){
            ingredientes.append("Piña")
            resultado!.append("Piña")
            ingredientesCantidad += 1
        }else{
            ingredientes = ingredientes.filter(){ $0 != "Piña"}
            resultado! = resultado!.filter(){ $0 != "Piña"}
            ingredientesCantidad -= 1
        }
        print(ingredientesCantidad)
    habilitarBoton()
  }
  
  @IBAction func cebolla(value: Bool) {
        if(value){
            ingredientes.append("Cebolla")
            resultado!.append("Cebolla")
            ingredientesCantidad += 1
        }else{
            ingredientes = ingredientes.filter(){ $0 != "Cebolla"}
            resultado! = resultado!.filter(){ $0 != "Cebolla"}
            ingredientesCantidad -= 1
        }
        print(ingredientesCantidad)
    habilitarBoton()
  }
  
  @IBAction func pimiento(value: Bool) {
    
        if(value){
            ingredientes.append("Pimiento")
            resultado!.append("Pimiento")
            ingredientesCantidad += 1
        }else{
            ingredientes = ingredientes.filter(){ $0 != "Pimiento"}
            resultado! = resultado!.filter(){ $0 != "Pimiento"}
            ingredientesCantidad -= 1
        }
        print(ingredientesCantidad)
    habilitarBoton()
  }
  
  func habilitarBoton() {
    if (ingredientes.count == 0 || ingredientes.count >= 7) {
      btnSiguiente.setHidden(true)
    } else {
      btnSiguiente.setHidden(false)
    }
  }
  
  @IBAction func btnActionSiguiente() {
//    for index in ingredientes {
//      resultado!.append(index)
//    }
    pushControllerWithName("IngredientesSegue", context: resultado)
  }
}
