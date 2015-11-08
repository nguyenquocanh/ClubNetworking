//
//  Person.swift
//  ClubNetworking
//
//  Created by Quoc Anh Nguyen on 11/7/15.
//  Copyright © 2015 gcall. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {
    var firstName: String
    var headLine: String
    var id: String
    var lastName: String
    var url: String
    
    override init() {
        self.firstName = "firstName"
        self.headLine = "headLine"
        self.id = "id"
        self.lastName = "lastName"
        self.url = "url"
    }

    init(id: String, firstName: String, lastName: String, headLine: String, url: String) {
        self.firstName = firstName
        self.headLine = headLine
        self.id = id
        self.lastName = lastName
        self.url = url
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey("firstName") as! String
        self.headLine = aDecoder.decodeObjectForKey("headLine") as! String
        self.id = aDecoder.decodeObjectForKey("id") as! String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as! String
        self.url = aDecoder.decodeObjectForKey("url") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.headLine, forKey: "headLine")
        aCoder.encodeObject(self.id, forKey: "id")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        aCoder.encodeObject(self.url, forKey: "url")
    }
}
