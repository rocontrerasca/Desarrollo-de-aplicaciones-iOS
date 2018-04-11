//
//  ImageControl.swift
//  BuscarImagenesCoreData
//
//  Created by Developer 1 on 4/11/18.
//  Copyright © 2018 comDeveloper. All rights reserved.
//

import UIKit
import CoreData

public class ImageControl {
    
    static var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    static func addImage(image: UIImage) -> NSObject {
        let objReceived = NSEntityDescription.insertNewObject(forEntityName: "Image", into: db.context)
        
        objReceived.setValue(UIImagePNGRepresentation(image), forKey: "content")
        
        return objReceived
    }
    
    static func addImages(images: [UIImage]) -> Set<NSObject> {
        var objects = Set<NSObject>()
        for image in images{
            objects.insert(self.addImage(image: image))
        }
        return objects
    }
}
