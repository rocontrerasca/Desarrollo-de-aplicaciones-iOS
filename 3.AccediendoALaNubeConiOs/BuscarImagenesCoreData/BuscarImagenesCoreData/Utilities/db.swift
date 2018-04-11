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
    
    static func save(){
        do{
          try self.context.save()
        }
        catch{
        }        
    }
}
