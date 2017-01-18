//
//  UserCollectionViewCell.swift
//  Chareety
//
//  Created by Raul  on 1/17/17.
//  Copyright © 2017 Chareety. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        let view = UIView()
        let imageView = UIImageView()
        let lblLabel = UILabel()
        
        view.frame = CGRect(x: 0, y: 0, width: (267.4/3)*valuePro, height: (267.4/3)*valuePro)
        self.addSubview(view)
        
        imageView.frame = CGRect(x: ((view.frame.size.width-64)*valuePro)/2, y:0*valuePro,width: 64*valuePro, height: 65.51*valuePro)
        imageView.image = #imageLiteral(resourceName: "userList")
        imageView.layer.cornerRadius = imageView.frame.size.height/2
        imageView.layer.masksToBounds = true
        view.addSubview(imageView)
        
        lblLabel.frame = CGRect(x: ((view.frame.size.width-46)*valuePro)/2, y: 65*valuePro,width: 46*valuePro, height: 20*valuePro)
        lblLabel.text = "Rafa"
        lblLabel.textAlignment = NSTextAlignment.center
        lblLabel.font = UIFont (name: "Avenir", size: 11.36*valuePro)
        lblLabel.textColor = UIColor.init(hexString: "4d4d4d")
        view.addSubview(lblLabel)
        
        
    }

}
