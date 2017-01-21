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
    let percentProgress : UIView = UIView()
    var imgBackgroundImage : UIImageView = UIImageView()
    var imgArtist : UIImageView = UIImageView()
    var lblTitle : UILabel = UILabel()
    var lblCount : UILabel = UILabel()
    var lblPercentTitle : UILabel = UILabel()
    
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
        btnInfo.titleLabel?.font = UIFont (name: "Avenir", size: 9*valuePro)
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
        strokeCustom.backgroundColor = UIColor.init(hexString: "F93D53")
        contentImage.addSubview(strokeCustom)
        
        let maskImage : UIView = UIView()
        maskImage.frame = CGRect(x:210*valuePro, y: 60*valuePro, width: 118*valuePro, height: 118*valuePro)
        maskImage.layer.cornerRadius = maskImage.frame.height/2
        maskImage.layer.masksToBounds = true
        maskImage.backgroundColor = UIColor.red
        contentImage.addSubview(maskImage)
        
        let shadowProgress:UIView = UIView()
        shadowProgress.frame = CGRect(x:160*valuePro, y: 140*valuePro, width: 125*valuePro, height: 10*valuePro)
        shadowProgress.backgroundColor = UIColor.init(hexString: "333333")
        self.contentCell.addSubview(shadowProgress)
        
        percentProgress.frame = CGRect(x:0*valuePro, y: 0*valuePro, width: 125*valuePro, height: 10*valuePro)
        percentProgress.backgroundColor = UIColor.init(hexString: "F93D53")
        shadowProgress.addSubview(percentProgress)
        
        lblPercentTitle = UILabel()
        lblPercentTitle.frame = CGRect(x:0*valuePro, y: 0*valuePro, width: 125*valuePro, height: 10*valuePro)
        lblPercentTitle.textColor = UIColor.white
        lblPercentTitle.font = UIFont (name: "Avenir-Light", size: 6.5*valuePro)
        shadowProgress.addSubview(lblPercentTitle)
        
        self.imgArtist.frame = CGRect(x:0*valuePro, y: -10*valuePro, width: 88*valuePro, height: 88*valuePro)
        maskImage.addSubview(self.imgArtist)
        
        self.imgArtist.image = #imageLiteral(resourceName: "userList")
        self.lblTitle.text = "Ayuda a los ninos de las calles del peru\ncon el apoyo de Mario Hart"
        self.lblCount.text = "260 Personas\nabrazaron esta causa"
        self.imgBackgroundImage.image = #imageLiteral(resourceName: "cellBackgroundImage")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func loadwithEntity(entity:EntityCause){
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        
        self.imgBackgroundImage.contentMode = .scaleAspectFill
        self.imgBackgroundImage.layer.masksToBounds = true
        self.imgBackgroundImage.sd_setImage(with: URL.init(string: entity.urlImageCause!))
        self.imgArtist.sd_setImage(with: URL.init(string: entity.urlImageAmbassador!))
        self.lblTitle.attributedText = atributedTitle(title: entity.title!, ambasador: entity.nameAbassador!)
        self.lblCount.attributedText = atributedTitleCount(title: "\(entity.people) ", ambasador: "Personas\nabrazaron esta causa")
    
        let percent:CGFloat = CGFloat(entity.percent)
        self.lblPercentTitle.text = "  \(percent*100)% Completado"
        self.percentProgress.frame = CGRect(x:0*valuePro, y: 0*valuePro, width: 125*valuePro*percent, height: 10*valuePro)
        
    }
    func atributedTitle(title:String,ambasador:String) -> NSMutableAttributedString{
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        
        let myMutableString = NSMutableAttributedString(
            string: "\(title) \(ambasador)",
            attributes: [NSFontAttributeName:UIFont(
                name: "Avenir-Light",
                size: 12.0*valuePro)!])
        let atributes:NSMutableString = NSMutableString()
        atributes.append("\(title) \(ambasador)")
      //  atributes.append(ambasador)
        
        let range:NSRange = atributes.range(of:"\(title)")
        myMutableString.addAttributes([NSFontAttributeName:UIFont(
            name: "Avenir-Light",
            size: 12.0*valuePro)!], range: range)
        
        let range2:NSRange = atributes.range(of:"\(ambasador)")
        myMutableString.addAttributes([NSFontAttributeName:UIFont(
            name: "Avenir-Black",
            size: 12.0*valuePro)!], range: range2)
        
        return myMutableString

    }
    func atributedTitleCount(title:String,ambasador:String) -> NSMutableAttributedString{
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        
        let myMutableString = NSMutableAttributedString(
            string: "\(title) \(ambasador)",
            attributes: [NSFontAttributeName:UIFont(
                name: "Avenir-Light",
                size: 9.5*valuePro)!])
        let atributes:NSMutableString = NSMutableString()
        atributes.append("\(title) \(ambasador)")
        //  atributes.append(ambasador)
        
        let range:NSRange = atributes.range(of:"\(title)")
        myMutableString.addAttributes([NSFontAttributeName:UIFont(
            name: "Avenir-Black",
            size: 9.5*valuePro)!], range: range)
        
        let range2:NSRange = atributes.range(of:"\(ambasador)")
        myMutableString.addAttributes([NSFontAttributeName:UIFont(
            name: "Avenir-Light",
            size: 9.5*valuePro)!], range: range2)
        
        return myMutableString
        
    }
}
