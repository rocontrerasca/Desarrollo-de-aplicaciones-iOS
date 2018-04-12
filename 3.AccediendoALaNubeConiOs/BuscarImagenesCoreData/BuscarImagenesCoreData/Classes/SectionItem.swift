//
//  SectionItem.swift
//  BuscarImagenesCoreData
//
//  Created by Developer 1 on 4/12/18.
//  Copyright © 2018 comDeveloper. All rights reserved.
//

import UIKit

struct SectionItem {
    var name: String
    var images : [UIImage]
    
    init(name:String, images:[UIImage]) {
        self.name = name
        self.images = images
    }
}
