//
//  HomeViewController.swift
//  ClubNetworking
//
//  Created by Quoc Anh Nguyen on 11/7/15.
//  Copyright © 2015 gcall. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var businesses: [Business] = []
    private var imageCache: [String: NSData] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.clipsToBounds = true
        self.view.layer.cornerRadius = 6
        
        Business.searchWithTerm("Bars", sort: YelpSortMode.Distance, categories: nil, deals: true) { (businesses, error) -> Void in
            if let businesses = businesses {
                self.businesses = businesses
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
                self.tableView.reloadData()
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.businesses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessTableViewCell", forIndexPath: indexPath) as! BusinessTableViewCell
        
        let business = self.businesses[indexPath.row]
        var dataImage = self.imageCache[business.name!]
        cell.setItem(business, image: dataImage)
        
        if dataImage == nil {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                
                dataImage = NSData(contentsOfURL: business.imageURL!)
                
                if let dataImage = dataImage {
                    self.imageCache[business.name!] = dataImage
                    dispatch_async(dispatch_get_main_queue(), {
                        if let cellUpdate = tableView.cellForRowAtIndexPath(indexPath) as? BusinessTableViewCell {
                            cellUpdate.imgImage.image = UIImage(data: dataImage)
                        }
                    })
                }
            })
        }
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
