//
//  ViewController.swift
//  EjemploClima
//
//  Created by Developer 1 on 3/30/18.
//  Copyright © 2018 comDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lblCityTemperature: UILabel!
    
    var cities : Array<Array<String>> = Array<Array<String>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cities.append(["Amazonas","2345047"])
        cities.append(["Bogotá","368148"])
        cities.append(["Medellin","368150"])
        cities.append(["Arauca","368458"])
        cities.append(["Barranquilla","368151"])
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.cities[row][0]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let urls = "https://query.yahooapis.com/v1/public/yql?format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&q=select%20item.condition%20from%20weather.forecast%20where%20woeid%20%3D%20"
        let url = NSURL(string: urls + self.cities[row][1])
        let datos : NSData? = NSData(contentsOf: url! as URL)
       
        if (datos != nil) {
            let jsonResponse = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
            if (jsonResponse?.length)! <= 1 {
                let alert = UIAlertController(title: "Mensaje", message: "No se han encontrado resultados", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                do{
                    guard let json = try JSONSerialization.jsonObject(with: datos! as Data, options: [])
                        as? NSDictionary else {
                            print("error trying to convert data to JSON")
                            return
                    }
                    
                    lblCityName.text = self.cities[row][0]
                    
                    let query = json["query"] as! NSDictionary
                    let results = query["results"] as! NSDictionary
                    let channel = results["channel"] as! NSDictionary
                    let item = channel["item"] as! NSDictionary
                    let condition = item["condition"] as! NSDictionary
                    
                    let temp = condition["temp"] as! NSString as String
                    
                    lblCityTemperature.text = temp
                }
                catch {}
            }
        } else {
            let alert = UIAlertController(title: "Mensaje", message: "No hay conexión a internet", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func getImageFromUrl(imageUrl: NSString) -> UIImage {
        
        let url = NSURL(string: imageUrl as String)
        
        let imgData:NSData? = NSData(contentsOf: url! as URL)
        
        let image = UIImage(data:imgData! as Data)
        
        return image!
    }
}

