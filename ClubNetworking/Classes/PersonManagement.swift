//
//  PersonManagement.swift
//  ClubNetworking
//
//  Created by Quoc Anh Nguyen on 11/7/15.
//  Copyright © 2015 gcall. All rights reserved.
//

import UIKit

class PersonManagement: NSObject {
    
    private var person: Person = Person()
    
    override init() {
        if let data = NSData(contentsOfFile: NSHomeDirectory().stringByAppendingString("/Documents/person.bin")) {
            let unarchivePerson = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! Person?
            if let unwrappedPerson = unarchivePerson {
                person = unwrappedPerson
            }
        }
    }
    
    func saveData() {
        let filename = NSHomeDirectory().stringByAppendingString("/Documents/person.bin")
        let data = NSKeyedArchiver.archivedDataWithRootObject(person)
        data.writeToFile(filename, atomically: true)
        let urlFilePath: NSURL? = NSURL(fileURLWithPath: filename)
        if let url = urlFilePath {
            do {
                try url.setResourceValue(true, forKey: NSURLIsExcludedFromBackupKey)
            }
            catch _ {}
        }
    }
    
    func getData() -> Person {
        return person
    }
    
    func updateData(person: Person) {
        self.person = person
        self.saveData()
    }
}
