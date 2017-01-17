//
//  ProfileViewController.swift
//  Chareety
//
//  Created by Raul Quispe on 1/3/17.
//  Copyright © 2017 Chareety. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        drawBody()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func drawBody(){
        view.backgroundColor = UIColor.white
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        
        let lblTitle = UILabel()
        lblTitle.frame =  CGRect(x: (view.frame.size.width-300*valuePro)/2, y: 20*valuePro, width: 300*valuePro, height: 17*valuePro)
        lblTitle.font = UIFont (name: "Avenir-Light", size: 14.51*valuePro)
        lblTitle.textColor = UIColor.init(hexString: "4D4D4D")
        lblTitle.text = "Perfil"
        lblTitle.textAlignment = NSTextAlignment.center

        let lblUserName = UILabel()
        lblUserName.frame =  CGRect(x: (view.frame.size.width-300*valuePro)/2, y: 92*valuePro, width: 300*valuePro, height: 17*valuePro)
        lblUserName.font = UIFont (name: "Avenir-Light", size: 14.51*valuePro)
        lblUserName.textColor = UIColor.init(hexString: "4D4D4D")
        lblUserName.text = "¡Hola, Rafel Reyes!"
        lblUserName.textAlignment = NSTextAlignment.center
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "CharetyAppLogo"))
        
        imageView.frame = CGRect(x: (self.view.frame.size.width-85.541*valuePro)/2, y: 134.951*valuePro, width: 85.541*valuePro, height: 85.541*valuePro)
        imageView.sd_setImage(with: URL.init(string: "https://pbs.twimg.com/profile_images/813356483723325440/tTolm9B9.jpg"))
        imageView.layer.cornerRadius = imageView.frame.size.height/2
        imageView.layer.masksToBounds = true
        
        let btnGrid = UIButton()
        btnGrid.frame =  CGRect(x: (view.frame.size.width-157*valuePro)/2, y:255*valuePro, width: 157*valuePro, height: 35*valuePro)
        btnGrid.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnGrid.setTitle("Causas que abraze",for: UIControlState.normal)
        btnGrid.layer.borderColor = UIColor.black.cgColor
        btnGrid.layer.cornerRadius = btnGrid.frame.size.height/2
        btnGrid.backgroundColor = UIColor.init(hexString: "00AFF1")
        btnGrid.setTitleColor(UIColor.white, for: .normal)
        btnGrid.addTarget(self, action: #selector(self.goEmbrace), for: UIControlEvents.touchUpInside)
        
        
        
        let lblMessagge = UILabel()
        lblMessagge.frame =  CGRect(x: (view.frame.size.width-300*valuePro)/2, y: 339*valuePro, width: 300*valuePro, height: 74*valuePro)
        lblMessagge.font = UIFont (name: "Avenir-Light", size: 25*valuePro)
        lblMessagge.textColor = UIColor.init(hexString: "4D4D4D")
        lblMessagge.text = "¿Cambiamos el \nmundo hoy?"
        lblMessagge.textAlignment = NSTextAlignment.center
        lblMessagge.lineBreakMode = NSLineBreakMode.byWordWrapping
        lblMessagge.numberOfLines = 2
        
        view.addSubview(btnGrid)
        view.addSubview(lblTitle)
        view.addSubview(lblUserName)
        view.addSubview(imageView)
        view.addSubview(lblMessagge)
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    // MARK: - Actions
    func goBack(sender: UIButton!) {
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    func goEmbrace(sender: UIButton!) {
        
        self.navigationController?.pushViewController(EmbriceViewController(), animated: true)
        
    }
    

}
