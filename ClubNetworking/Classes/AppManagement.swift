//
//  AppManagement.swift
//  ClubNetworking
//
//  Created by Quoc Anh Nguyen on 11/7/15.
//  Copyright © 2015 gcall. All rights reserved.
//

import UIKit

class AppManagement: NSObject {
    private let personManagement: PersonManagement
    
    class var sharedInstance: AppManagement {
        struct Singleton {
            static var instance: AppManagement?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Singleton.token, {
            Singleton.instance = AppManagement()
        })
        
        return Singleton.instance!
    }
    
    override init() {
        self.personManagement = PersonManagement()
        super.init()
    }
    
    func getPerson() -> Person {
        return self.personManagement.getData()
    }
    
    func savePerson() {
        return self.personManagement.saveData()
    }
    
    func updatePerson(person:Person) {
        self.personManagement.updateData(person)
    }
    
    func signIn(completion: (success: Bool)->()){
        // Do any additional setup after loading the view.
        LISDKSessionManager.createSessionWithAuth([LISDK_BASIC_PROFILE_PERMISSION], state: nil, showGoToAppStoreDialog: true, successBlock: { (returnState) -> Void in
            print("success createSessionWithAuth")
            let url = NSString(string:"https://api.linkedin.com/v1/people/~")
            if LISDKSessionManager.hasValidSession() {
                LISDKAPIHelper.sharedInstance().getRequest(url as String, success: {
                    (response) in
                    //Do something with the response
                    print(response.data)
                    if let dataFromString = response.data.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
                        let json = JSON(data: dataFromString)
                        let firstName = json["firstName"].string
                        let headline = json["headline"].string
                        let id = json["id"].string
                        let lastName = json["lastName"].string
                        let jsonUrl = json["siteStandardProfileRequest"]
                        let url = jsonUrl["url"].string
                        print("success createSessionWithAuth")
                        let person = Person(id: id!, firstName: firstName!, lastName: lastName!, headLine: headline!, url: url!)
                        print("success createSessionWithAuth")
                        self.updatePerson(person)
                        NSUserDefaults.standardUserDefaults().setBool(true, forKey: kSignedIn)
                        completion(success: true)
                        print("success createSessionWithAuth")
                    }
                    else {
                        completion(success: false)
                    }
                    
                    }, error: {
                        error in
                        //Do something with the error
                        if error != nil {
                            //completion(success: false)
                        }
                })
            }
            }) { (error) -> Void in
                print("error createSessionWithAuth")
                completion(success: false)
        }
    }
    
    
}
