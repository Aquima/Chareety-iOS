//
//  CauseTableViewCell.swift
//  Chareety
//
//  Created by Raul Quispe on 1/3/17.
//  Copyright © 2017 Chareety. All rights reserved.
//

import UIKit

class CauseTableViewCell: UITableViewCell {
    
    var contentCell : UIView = UIView()
    var imgBackgroundImage : UIImageView = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        
       // self.contentCell = UIView()
        self.contentCell.frame = CGRect(x:0*valuePro, y: 10*valuePro, width: 293*valuePro, height: 169*valuePro)
        self.contentCell.backgroundColor = UIColor.red
        addSubview(self.contentCell)
        
        self.imgBackgroundImage.frame = CGRect(x:0*valuePro, y: 0*valuePro, width: 293*valuePro, height: 169*valuePro)
        self.contentCell.addSubview(imgBackgroundImage)
        
        let shadow:UIView = UIView( frame:CGRect(x:0*valuePro, y: 0*valuePro, width: 293*valuePro, height: 169*valuePro))
        shadow.alpha=0.5
        shadow.backgroundColor = UIColor.black
        self.contentCell.addSubview(shadow)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
