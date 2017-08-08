//
//  ViewController.swift
//  PeticionWebServicdor
//
//  Created by Developer 1 on 8/2/17.
//  Copyright © 2017 comDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblResultado: UILabel!
    @IBOutlet weak var txtISBN: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SearchingISBN(_ sender: UITextField, forEvent event: UIEvent) {
        sender.resignFirstResponder()
        
        let ISBN = txtISBN.text!
        
        let urls: String = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + ISBN
        
        //978-84-376-0494-7"
        
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOf: url! as URL)
        
        if (datos != nil) {
            let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
            if (texto?.length)! <= 2 {
                self.lblResultado.text = "No se ha encontrado ningun resultado para el ISBN: " + ISBN
            }
            else {
                self.lblResultado.text = texto! as String
            }
        } else {
            lblResultado.text = "No hay conexión a Internet"
        }
    }
    
}

