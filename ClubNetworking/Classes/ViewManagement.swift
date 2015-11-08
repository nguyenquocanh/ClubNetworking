//
//  ViewManagement.swift
//  ClubNetworking
//
//  Created by Quoc Anh Nguyen on 11/7/15.
//  Copyright © 2015 gcall. All rights reserved.
//

import UIKit

class ViewManagement: NSObject {
    class var sharedInstance: ViewManagement {
        struct Singleton {
            static let instance = ViewManagement()
        }
        return Singleton.instance
    }
    
    func alertViewController() -> Hokusai {
        let alertView = Hokusai()
        alertView.colors = HOKColors(
            backGroundColor: UIColor(red: 82/255, green: 25/255, blue: 126/255, alpha: 1.0),
            buttonColor: UIColor.whiteColor().colorWithAlphaComponent(0.1),
            cancelButtonColor: UIColor.whiteColor().colorWithAlphaComponent(0.3),
            fontColor: UIColor.whiteColor()
        )
        //alertView.fontName = "UVNVanBold"
        return alertView
    }
    
    func alertViewWithTitle(title: String) -> Hokusai {
        let alertView = Hokusai()
        alertView.colors = HOKColors(
            backGroundColor: UIColor(red: 82/255, green: 25/255, blue: 126/255, alpha: 1.0),
            buttonColor: UIColor.whiteColor().colorWithAlphaComponent(0.1),
            cancelButtonColor: UIColor.clearColor(),
            fontColor: UIColor.whiteColor()
        )
        alertView.cancelButtonTitle = title
        return alertView
    }
}
