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
    var imgArtist : UIImageView = UIImageView()
    var lblTitle : UILabel = UILabel()
    var lblCount : UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())

        self.contentCell.frame = CGRect(x:0*valuePro, y: 10*valuePro, width: 293*valuePro, height: 169*valuePro)
        self.contentCell.layer.borderColor = UIColor.lightGray.cgColor
        self.contentCell.layer.masksToBounds = true
        self.contentCell.layer.borderWidth = 0.5
        addSubview(self.contentCell)
        
        self.imgBackgroundImage.frame = CGRect(x:0*valuePro, y: 0*valuePro, width: 293*valuePro, height: 132*valuePro)
        self.contentCell.addSubview(imgBackgroundImage)
        
        let shadow:UIView = UIView( frame:CGRect(x:0*valuePro, y: 0*valuePro, width: 293*valuePro, height: 132*valuePro))
        shadow.alpha=0.5
        shadow.backgroundColor = UIColor.black
        self.contentCell.addSubview(shadow)

        self.lblTitle.frame =  CGRect(x: 8*valuePro, y: 14*valuePro, width: 211*valuePro, height: 34*valuePro)
        self.lblTitle.font = UIFont (name: "Avenir-Light", size: 12*valuePro)
        self.lblTitle.textColor = UIColor.init(hexString: "ffffff")
        self.lblTitle.textAlignment = NSTextAlignment.left
        self.lblTitle.numberOfLines = 2
        self.lblTitle.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.contentCell.addSubview(self.lblTitle)
       
        
        let btnInfo = UIButton()
        btnInfo.frame =  CGRect(x: 16*valuePro, y: 101*valuePro, width: 115*valuePro, height: 22*valuePro)
        btnInfo.titleLabel?.font = UIFont (name: "Avenir-Light", size: 9*valuePro)
        btnInfo.setTitle("mas información    ▷",for: UIControlState.normal)
        btnInfo.layer.borderColor = UIColor.black.cgColor
        btnInfo.layer.cornerRadius = btnInfo.frame.size.height/2
        btnInfo.backgroundColor = UIColor.init(hexString: "00AFF1")
        btnInfo.setTitleColor(UIColor.white, for: .normal)
        self.contentCell.addSubview(btnInfo)
        
        self.lblCount.frame =  CGRect(x: 16*valuePro, y: 136*valuePro, width: 211*valuePro, height: 30*valuePro)
        self.lblCount.font = UIFont (name: "Avenir-Light", size: 9.5*valuePro)
        self.lblCount.textColor = UIColor.init(hexString: "4d4d4d")
        self.lblCount.textAlignment = NSTextAlignment.left
        self.lblCount.numberOfLines = 2
        self.lblCount.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.contentCell.addSubview(self.lblCount)
        self.contentCell.addSubview(self.lblCount)
        
        let contentImage : UIView = UIView()
        contentImage.frame = CGRect(x:0*valuePro, y: 0*valuePro, width: 293*valuePro, height: 132*valuePro)
        contentImage.layer.masksToBounds = true
        
        self.contentCell.addSubview(contentImage)
        
        let strokeCustom : UIView = UIView()
        strokeCustom.frame = CGRect(x:189*valuePro, y: 49*valuePro, width: 135*valuePro, height: 135*valuePro)
        strokeCustom.layer.cornerRadius = strokeCustom.frame.height/2
        strokeCustom.layer.masksToBounds = true
        strokeCustom.backgroundColor = UIColor.init(hexString: "8bcd1f")
        contentImage.addSubview(strokeCustom)
        
        let maskImage : UIView = UIView()
        maskImage.frame = CGRect(x:210*valuePro, y: 60*valuePro, width: 118*valuePro, height: 118*valuePro)
        maskImage.layer.cornerRadius = maskImage.frame.height/2
        maskImage.layer.masksToBounds = true
        maskImage.backgroundColor = UIColor.red
        contentImage.addSubview(maskImage)

        self.imgArtist.frame = CGRect(x:0*valuePro, y: -10*valuePro, width: 88*valuePro, height: 88*valuePro)
        maskImage.addSubview(self.imgArtist)
        
        self.imgArtist.frame = CGRect(x:210*valuePro, y: 60*valuePro, width: 118*valuePro, height: 118*valuePro)
        self.lblTitle.text = "Ayuda a los ninos de las calles del peru\ncon el apoyo de Mario Hart"
        self.lblCount.text = "260 Personas\nabrazaron esta causa"
        self.imgBackgroundImage.image = #imageLiteral(resourceName: "cellBackgroundImage")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
