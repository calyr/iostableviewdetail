//
//  Libro.swift
//  NuevoTableView
//
//  Created by Roberto Carlos Callisaya Mamani on 7/25/16.
//  Copyright © 2016 Roberto Carlos Callisaya Mamani. All rights reserved.
//

import Foundation
import UIKit

class Libro{
    var isnb : String
    var titulo : String
    var autores : String
    var cover : UIImageView!
    
    init(){
        self.isnb = ""
        self.titulo = ""
        self.autores = ""
        self.cover = UIImageView()
        
    
    }
    
}