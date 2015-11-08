//
//  MainViewController.swift
//  ClubNetworking
//
//  Created by Quoc Anh Nguyen on 11/7/15.
//  Copyright © 2015 gcall. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController, BarViewControllerDelegate {
    
    private var homeViewController: HomeViewController?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addCenterButtonWithImage(UIImage(named: "camera_button_take.png"), highlightImage: UIImage(named: "tabBar_cameraButton_ready_matte.png"))
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centerButtonAction(barViewController: BaseViewController!) {
        print(".....")
        let meetupViewController = Utils.mainStoryboard.instantiateViewControllerWithIdentifier("MeetupViewController") as? MeetupViewController
        let navigationController = UINavigationController(rootViewController: meetupViewController!)
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
}
