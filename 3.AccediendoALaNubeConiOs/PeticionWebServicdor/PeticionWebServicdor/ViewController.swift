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
        guard let url = URL(string: urls) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                //self.showAlertBox(message: "A ocurrido un error de conexion")
                self.lblResultado.text = "A ocurrido un error de conexion"
                return
            }
            
            guard let data = data else {
                self.lblResultado.text = "No se ha encontrado ningun resultado para el ISBN: " + ISBN
                return
            }
            
            let resultado = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            
            if (resultado?.length)! <= 2 {
            self.lblResultado.text = "No se ha encontrado ningun resultado para el ISBN: " + ISBN
            }
            else {
            self.lblResultado.text = resultado! as String
            }
        }
        task.resume()
    }
    
    func showAlertBox(message: String){
        let alertMessage = UIAlertController(title: "Conexion OpenLibrary", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertMessage.addAction(UIAlertAction(title: "Cerrar", style: UIAlertActionStyle.default,handler: nil))
        present(alertMessage, animated: true, completion: nil)
    }

}

