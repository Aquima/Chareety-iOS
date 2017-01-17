//
//  DetailCauseViewController.swift
//  Chareety
//
//  Created by Raul Quispe on 1/16/17.
//  Copyright © 2017 Chareety. All rights reserved.
//

import UIKit

class DetailCauseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        drawBody()
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        
        let btnBack = UIButton()
        btnBack.frame =  CGRect(x:10*valuePro, y: 10*valuePro, width: 40*valuePro, height: 40*valuePro)
        btnBack.backgroundColor = UIColor.clear
        btnBack.addTarget(self, action: #selector(self.goBack), for: UIControlEvents.touchUpInside)
        btnBack.setImage(#imageLiteral(resourceName: "btnBack"), for: UIControlState.normal)
        view.addSubview(btnBack)
        
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
        
        imageView.frame = CGRect(x: (self.view.frame.size.width-157.541*valuePro)/2, y: 29*valuePro, width: 157.541*valuePro, height: 157.754*valuePro)
        self.view.addSubview(imageView)
        
        let lblTitle = UILabel()
        lblTitle.frame =  CGRect(x: (self.view.frame.size.width-280*valuePro)/2, y: 226*valuePro, width: 280*valuePro, height: 38*valuePro)
        lblTitle.font = UIFont (name: "Avenir", size: 12.8*valuePro)
        lblTitle.textColor = UIColor.init(hexString: "1A1A1A")
        lblTitle.text = "Ayuda a los niños de las calles del PERU\ncon el apoyo de Mario Hart"
        lblTitle.textAlignment = NSTextAlignment.left
        lblTitle.numberOfLines = 2
        lblTitle.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.view.addSubview(lblTitle)
        
    }

   // MARK: - Actions
    func goBack(sender: UIButton!) {
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }
}
