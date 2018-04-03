//
//  File.swift
//  ConsultaLibros
//
//  Created by Developer 1 on 4/3/18.
//  Copyright © 2018 comDeveloper. All rights reserved.
//

import Foundation
import UIKit

struct  Book {
    var name : String
    var isbn : String
    var cover : UIImage?
    var authors: String
    
    init() {
        self.name = ""
        self.isbn = ""
        self.authors = ""
        self.cover = nil
    }
    
    init(name:String, isbn:String, cover:UIImage?, authors:String) {
        self.name = name
        self.isbn=isbn
        self.cover = cover
        self.authors = authors
    }
}
