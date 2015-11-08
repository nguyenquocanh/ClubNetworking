//
//  BusinessTableViewCell.swift
//  ClubNetworking
//
//  Created by Quoc Anh Nguyen on 11/8/15.
//  Copyright © 2015 gcall. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {

    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setItem(business: Business, image: NSData?) {
        self.lblAddress.text = business.address!
        self.lblName.text = business.name!
        
        if let image = image {
            self.imgImage.image = UIImage(data: image)
        }
    }

}
