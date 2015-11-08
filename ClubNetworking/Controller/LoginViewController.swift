//
//  LoginViewController.swift
//  ClubNetworking
//
//  Created by Quoc Anh Nguyen on 11/7/15.
//  Copyright © 2015 gcall. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var btnSignIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnSignIn.addTarget(self, action: "didSignIn", forControlEvents: UIControlEvents.TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didSignIn() {
        AppManagement.sharedInstance.signIn { (success) -> () in
            if success {
                let homeViewController = Utils.mainStoryboard.instantiateViewControllerWithIdentifier("MainViewController") as? MainViewController
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.window?.rootViewController = homeViewController
            }
            else {
                ViewManagement.sharedInstance.alertViewWithTitle("Sign in failed!").show()
            }
        }
    }

}
