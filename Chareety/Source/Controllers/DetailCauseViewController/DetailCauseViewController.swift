//
//  DetailCauseViewController.swift
//  Chareety
//
//  Created by Raul Quispe on 1/16/17.
//  Copyright © 2017 Chareety. All rights reserved.
//

import UIKit

class DetailCauseViewController: UIViewController {

    var contentForm:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        // Do any additional setup after loading the view.
        contentForm = UIScrollView()
        contentForm.frame =  CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-(self.tabBarController?.tabBar.frame.size.height)!)
        
        contentForm.contentSize = CGSize(width: self.view.frame.size.width, height: 781*valuePro-(self.tabBarController?.tabBar.frame.size.height)!)
        self.view.addSubview(contentForm)
        drawBody()
        
        
        let btnBack = UIButton()
        btnBack.frame =  CGRect(x:10*valuePro, y: 10*valuePro, width: 40*valuePro, height: 40*valuePro)
        btnBack.backgroundColor = UIColor.clear
        btnBack.addTarget(self, action: #selector(self.goBack), for: UIControlEvents.touchUpInside)
        btnBack.setImage(#imageLiteral(resourceName: "btnBack"), for: UIControlState.normal)
        contentForm.addSubview(btnBack)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Components
    func drawBody(){
        self.view.backgroundColor = UIColor.white
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "CharetyAppLogo"))
        
        imageView.frame = CGRect(x: ((self.view.frame.size.width-157.541)*valuePro)/2, y: 29*valuePro, width: 157.541*valuePro, height: 157.754*valuePro)
        self.contentForm.addSubview(imageView)
        
        let lblTitle = UILabel()
        lblTitle.frame =  CGRect(x: (self.view.frame.size.width-280*valuePro)/2, y: 226*valuePro, width: 280*valuePro, height: 38*valuePro)
        lblTitle.font = UIFont (name: "Avenir", size: 12.8*valuePro)
        lblTitle.textColor = UIColor.init(hexString: "1A1A1A")
        lblTitle.text = "Ayuda a los niños de las calles del PERU\ncon el apoyo de Mario Hart"
        lblTitle.textAlignment = NSTextAlignment.left
        lblTitle.numberOfLines = 2
        lblTitle.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.contentForm.addSubview(lblTitle)
        
        let view1 = UIView()
        view1.frame = CGRect(x: (view.frame.size.width-294.4*valuePro)/2, y: 271.78*valuePro, width: 294.4*valuePro, height: 69.687*valuePro)
        view1.backgroundColor = UIColor.init(hexString: "f2f2f2")
        self.contentForm.addSubview(view1)
        
        let lblLabel = UILabel()
        lblLabel.frame = CGRect(x: 244.69*valuePro, y: 12*valuePro, width: 31.326*valuePro, height: 11.042*valuePro)
        lblLabel.font = UIFont(name: "Avenir-Light", size: 10*valuePro)
        lblLabel.textColor = UIColor.red
        lblLabel.textAlignment = NSTextAlignment.right
        lblLabel.text = "Apoya:"
        view1.addSubview(lblLabel)
        
        let image = UIImageView()
        image.frame = CGRect(x: 254.172*valuePro, y: 27.686*valuePro, width: 30.293*valuePro, height: 30.293*valuePro )
        image.image = #imageLiteral(resourceName: "userList")
        image.layer.cornerRadius = image.frame.size.height/2
        image.layer.masksToBounds = true
        view1.addSubview(image)
        
        let view2 = UIView()
        view2.frame = CGRect(x:234.667*valuePro,y: 33.684*valuePro,width: 11.089*valuePro,height: 17.742*valuePro)
        view2.backgroundColor = UIColor.init(hexString: "b3b3b3")
        view1.addSubview(view2)
        let view3 = UIView()
        view3.frame = CGRect(x:(view.frame.size.width-294.4*valuePro)/2,y:352.924*valuePro,width: 294.4*valuePro,height:2.56*valuePro)
        view3.backgroundColor = UIColor.init(hexString: "f2f2f2")
        self.contentForm.addSubview(view3)
        let view4 = UIView()
        view4.frame = CGRect(x: (view.frame.size.width-1.28*valuePro)/2,y: 367.36*valuePro,width:1.28*valuePro,height: 41.813*valuePro)
        view4.backgroundColor = UIColor.init(hexString: "f2f2f2")
        self.contentForm.addSubview(view4)
        
        let lblLabel2 = UILabel()
        lblLabel2.frame = CGRect(x: 25.173*valuePro, y: 367.36*valuePro, width: 97.221*valuePro, height: 12.247*valuePro)
        lblLabel2.font = UIFont(name: "Avenir-Light", size: 11.09*valuePro)
        lblLabel2.textColor = UIColor.init(hexString: "333333")
        lblLabel2.textAlignment = NSTextAlignment.left
        lblLabel2.text = "Abrazan esta causa:"
        self.contentForm.addSubview(lblLabel2)
        
        let image2 = UIImageView()
        image2.frame = CGRect(x: 22.923*valuePro, y: 384*valuePro, width: 30.293*valuePro, height: 30.293*valuePro )
        image2.image = #imageLiteral(resourceName: "userList")
        image2.layer.cornerRadius = image.frame.size.height/2
        image2.layer.masksToBounds = true
        self.contentForm.addSubview(image2)
        let image3 = UIImageView()
        image3.frame = CGRect(x: 67.584*valuePro, y: 384*valuePro, width: 30.293*valuePro, height: 30.293*valuePro )
        image3.image = #imageLiteral(resourceName: "userList")
        image3.layer.cornerRadius = image.frame.size.height/2
        image3.layer.masksToBounds = true
        self.contentForm.addSubview(image3)
        let image4 = UIImageView()
        image4.frame = CGRect(x: 111.582*valuePro, y: 384*valuePro, width: 30.293*valuePro, height: 30.293*valuePro )
        image4.image = #imageLiteral(resourceName: "userList")
        image4.layer.cornerRadius = image.frame.size.height/2
        image4.layer.masksToBounds = true
        self.contentForm.addSubview(image4)
        
        
        let shadowProgress:UIView = UIView()
        shadowProgress.frame = CGRect(x: 170.24*valuePro,y: 380.16*valuePro,width:126.293*valuePro,height:10.24*valuePro)
        shadowProgress.backgroundColor = UIColor.init(hexString: "e6e6e6")
        self.contentForm.addSubview(shadowProgress)
        
        let percent:CGFloat = CGFloat(0.75)
        let percentProgress: UIView = UIView()
        percentProgress.frame = CGRect(x:0*valuePro, y: 0*valuePro, width: 126.293*valuePro*percent, height: 10.24*valuePro)
        percentProgress.backgroundColor = UIColor.init(hexString: "f93d53")
        shadowProgress.addSubview(percentProgress)
        
        let lblLabel3 = UILabel()
        lblLabel3.frame = CGRect(x: 170.24*valuePro, y: 393.09*valuePro , width: 100*valuePro, height: 10.75*valuePro)
        lblLabel3.font = UIFont(name: "Avenir-Light", size: 11.09*valuePro)
        lblLabel3.textColor = UIColor.init(hexString: "f93d53")
        lblLabel3.text = "75% Completado"
        self.contentForm.addSubview(lblLabel3)
        
        
        let lblTitle2 = UILabel()
        lblTitle2.frame = CGRect(x: (view.frame.size.width-161.5*valuePro)/2, y: 435.52, width: 161.5, height: 15.15)
        lblTitle2.font = UIFont(name: "Avenir-Light", size: 12.8*valuePro)
        lblTitle2.textColor = UIColor.init(hexString: "333333")
        lblTitle2.text = "Acerca de este Proyecto"
        lblTitle2.textAlignment = NSTextAlignment.center
        self.contentForm.addSubview(lblTitle2)
        
        let txtvTermsContent = UITextView()
        txtvTermsContent.frame =  CGRect(x: (view.frame.size.width-270.52*valuePro)/2, y: 461.82*valuePro, width: 270.52*valuePro, height: 300.426*valuePro - (self.tabBarController?.tabBar.frame.height)!)
        txtvTermsContent.font = UIFont (name: "Avenir-Light", size: 10.24*valuePro)
        txtvTermsContent.textColor = UIColor.init(hexString: "4d4d4d")
        txtvTermsContent.textAlignment = NSTextAlignment.center
        txtvTermsContent.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, cons ectetuer adipiscing elit, Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi."
        
        self.contentForm.addSubview(txtvTermsContent)
        
        let btnDonate = UIButton()
        btnDonate.frame =  CGRect(x: (self.view.frame.size.width-290.909*valuePro)/2, y: 737.707*valuePro, width: 290.909*valuePro, height: 35*valuePro)
        btnDonate.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnDonate.setTitle("Donar Ahora",for: UIControlState.normal)
        btnDonate.layer.borderColor = UIColor.init(hexString: "f93d53").cgColor
        btnDonate.layer.cornerRadius = btnDonate.frame.size.height/2
        btnDonate.backgroundColor = UIColor.init(hexString: "f93d53")
        btnDonate.setTitleColor(UIColor.white, for: .normal)
        contentForm.addSubview(btnDonate)
        
        view.addSubview(contentForm)
        
    }

   // MARK: - Actions
    /*
    func loadPercen(entity:){
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        let percentProgress: UIView = UIView()
        self.lblPercentTitle.text = "  \(entity.percent*100)% Completado"
        let percent:CGFloat = CGFloat(entity.percent)
        self.percentProgress.frame = CGRect(x:0*valuePro, y: 0*valuePro, width: 125*valuePro*percent, height: 10*valuePro)
    }*/
    
    func goBack(sender: UIButton!) {
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    
    
}
