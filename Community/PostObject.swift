//
//  PostObject.swift
//  Community
//
//  Created by Ibrahim Oyekan on 1/21/17.
//  Copyright © 2017 Soya. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class PostObject {
    
    //var id: Int?
    var author: String?
    var subject: String?
    var summary: String?
    var text: String?
    var rating: Int?
    //var post_date: Int?
    
    
    init(author: String?, subject: String?, summary: String?, text: String?, rating: Int?){
        
        //self.id = id
        self.author = author
        self.subject = subject
        self.summary = summary
        self.text = text
        self.rating = rating
       // self.post_date = post_date
        
    }
    
    init() {
        
    }
    


    
}
