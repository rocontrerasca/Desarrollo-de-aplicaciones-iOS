//
//  db.swift
//  BuscarImagenesCoreData
//
//  Created by Developer 1 on 4/11/18.
//  Copyright © 2018 comDeveloper. All rights reserved.
//

import UIKit
import CoreData

public class SectionControl {
    
    static var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static func verifySection(nameToSearch: String) -> Bool {
        let objReceived = NSEntityDescription.entity(forEntityName: "Section", in: db.context)
        let request = objReceived?.managedObjectModel.fetchRequestFromTemplate(withName: "getSection", substitutionVariables: ["sectionName" : nameToSearch])
        
        do{
            let requestResult = try self.context.fetch(request!)
            
            if requestResult.count > 0{
                return true
            }
            else{
                return false
            }
        }
        catch{
            return false
        }
    }
    
    static func addSection(name:String, images:[UIImage]) {        
        let objReceived = NSEntityDescription.insertNewObject(forEntityName: "Section", into: db.context)
        
        objReceived.setValue(name, forKey: "name")
        objReceived.setValue(ImageControl.addImages(images: images), forKey: "have")
    }
}
