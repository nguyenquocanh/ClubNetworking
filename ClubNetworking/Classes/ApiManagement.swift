//
//  ApiManagement.swift
//  ClubNetworking
//
//  Created by Quoc Anh Nguyen on 11/7/15.
//  Copyright © 2015 gcall. All rights reserved.
//

import UIKit

class ApiManagement: NSObject {
    class var sharedInstance: ApiManagement {
        struct Singleton {
            static let instance = ApiManagement()
        }
        return Singleton.instance
    }
    
    
}
