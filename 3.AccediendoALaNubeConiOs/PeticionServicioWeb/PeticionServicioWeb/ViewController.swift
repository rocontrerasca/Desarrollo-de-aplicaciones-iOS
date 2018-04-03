//
//  ViewController.swift
//  PeticionServicioWeb
//
//  Created by Developer 1 on 8/8/17.
//  Copyright © 2017 comDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var lblResultado: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtISBN: UITextField!
    @IBOutlet weak var lblAuthors: UILabel!
    @IBOutlet weak var coverImg: UIImageView!
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
        self.lblResultado.text = ""
        stackView.isHidden = true
        
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
                do{
                    guard let json = try JSONSerialization.jsonObject(with: datos! as Data, options: [])
                                        as? NSDictionary else {
                                            print("error trying to convert data to JSON")
                                            return
                                    }
                                        
                    let info = json["ISBN:" + ISBN] as! NSDictionary
                    let authorsArray = (info["authors"]! as! NSArray).mutableCopy() as! NSMutableArray
                    
                    let authors = authorsArray[0] as! NSDictionary
                    
                    let authorsName = authors ["name"] as? String
                    
                    let title = info["title"] as? String
                    
                    let covers = info["cover"] as? NSDictionary
                    
                    if(covers != nil){
                        let coverUrl = covers?["medium"] as! NSString
                    
                        let cover = getCover(imageuRL: coverUrl)
                        
                        coverImg.image = cover
                    }
                    else{
                    coverImg.image = #imageLiteral(resourceName: "Image")
                    }
                    lblAuthors.text = authorsName
                    
                    lblTitle.text = title
                    
                    stackView.isHidden = false
                }
                catch {
                
                }
            
            }
        } else {
            lblResultado.text = "No hay conexión a Internet"
        }
    }
    
    func getCover(imageuRL: NSString) -> UIImage {
        
        let url = NSURL(string: imageuRL as String)
        
        let imgData:NSData? = NSData(contentsOf: url! as URL)
        
        let image = UIImage(data:imgData! as Data)
        
        return image!
    }


}

