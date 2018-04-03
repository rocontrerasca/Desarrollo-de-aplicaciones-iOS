//
//  CityController.swift
//  EjemploClimaTableView
//
//  Created by Developer 1 on 4/2/18.
//  Copyright © 2018 comDeveloper. All rights reserved.
//

import UIKit

class CityController: UIViewController {

    var cityCode = ""
    var cityName = ""
    
    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lblCityTemp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getTemp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getTemp() -> Void{
        let urls = "https://query.yahooapis.com/v1/public/yql?format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&q=select%20item.condition%20from%20weather.forecast%20where%20woeid%20%3D%20"
        let url = NSURL(string: urls + cityCode)
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
                    
                    lblCityName.text = cityName
                    
                    let query = json["query"] as! NSDictionary
                    let results = query["results"] as! NSDictionary
                    let channel = results["channel"] as! NSDictionary
                    let item = channel["item"] as! NSDictionary
                    let condition = item["condition"] as! NSDictionary
                    
                    let temp = condition["temp"] as! NSString as String
                    
                    lblCityTemp.text = temp
                }
                catch {}
            }
        } else {
            let alert = UIAlertController(title: "Mensaje", message: "No hay conexión a internet", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
