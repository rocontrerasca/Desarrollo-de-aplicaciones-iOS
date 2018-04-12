//
//  db.swift
//  BuscarImagenesCoreData
//
//  Created by Developer 1 on 4/11/18.
//  Copyright © 2018 comDeveloper. All rights reserved.
//

import UIKit
import CoreData

public class db {
    static var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Section Control
    
    static func queryExample(){
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        //Let’s work on our request. We want to fetch just a one record:
        userFetch.fetchLimit = 1
        
        //and only when a name is “John”:
        userFetch.predicate = NSPredicate(format: "name = %@", "John")
        
        //Moreover, we want to sort by an email address with ascending order:
        userFetch.sortDescriptors = [NSSortDescriptor.init(key: "email", ascending: true)]
        
        //Let’s execute the query:
        //let users = try! self.context.fetch(userFetch)
        
        //Now we can pick the first result and print how many cars he has :)
        /*let john: User = users.first as! User
        print("Email: \(john.email!)")
        let johnCars = john.cars?.allObjects as! [Car]
        print("has \(johnCars.count)")*/
        
        
        /*
         let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
         request.predicate = NSPredicate(format: "age = %@", "12")
         request.returnsObjectsAsFaults = false
         do {
         let result = try context.fetch(request)
         for data in result as! [NSManagedObject] {
         print(data.value(forKey: "username") as! String)
         }
         
         } catch {
         
         print("Failed")
         }
         */        
    }
    
    static func verifySection(nameToSearch: String) -> Bool {
        //Query with a storeProcedure
        
        let objReceived = NSEntityDescription.entity(forEntityName: "Section", in: self.context)
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
    
    static func getSections() ->[SectionItem] {
        var sections: [SectionItem] = []
        
        let objReceived = NSEntityDescription.entity(forEntityName: "Section", in: self.context)
        let request = objReceived?.managedObjectModel.fetchRequestTemplate(forName: "getSections")
        
        do{
            let result = try self.context.fetch(request!)
            
            for data in result as! [NSManagedObject] {
                let name = data.value(forKey: "name") as! String
                var images: [UIImage] = []
                let imagesData = data.value(forKey: "have") as! Set<NSObject>
                for imgData in imagesData{
                    if let img = UIImage(data: (imgData.value(forKey: "content") as! NSData) as Data){
                      images.append(img)
                    }
                }
                sections.append(SectionItem(name: name, images: images))
            }
        }
        catch{
        }
        
        return sections
    }
    
    static func addSection(name:String, images:[UIImage]) {
        let sectionEntity = NSEntityDescription.entity(forEntityName: "Section", in: self.context)!
        let section = NSManagedObject(entity: sectionEntity, insertInto: self.context)
        
        section.setValue(name, forKey: "name")
        section.setValue(self.addImages(images: images), forKey: "have")
    }
    
    //Image Control
    static func addImage(image: UIImage) -> NSObject {
        let imageEntity = NSEntityDescription.entity(forEntityName: "Image", in: self.context)!
        let imgeObj = NSManagedObject(entity: imageEntity, insertInto: self.context)
        
        imgeObj.setValue(UIImagePNGRepresentation(image), forKey: "content")
        
        return imgeObj
    }
    
    static func addImages(images: [UIImage]) -> Set<NSObject> {
        var objects = Set<NSObject>()
        for image in images{
            objects.insert(self.addImage(image: image))
        }
        return objects
    }
    
    
    static func save(){
        do{
          try self.context.save()
        }
        catch{
        }        
    }
}
