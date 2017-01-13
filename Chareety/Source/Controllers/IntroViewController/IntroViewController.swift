//
//  IntroViewController.swift
//  Chareety
//
//  Created by Raul Quispe on 12/25/16.
//  Copyright © 2016 Chareety. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, RegisterViewControllerDelegate, LogInViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        drawBody()
        // Do any additional setup after loading the view.
    }

    func drawBody(){
        view.backgroundColor = UIColor.white
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "CharetyAppLogo"))
        
        imageView.frame = CGRect(x: (self.view.frame.size.width-157.541*valuePro)/2, y: 94.951*valuePro, width: 157.541*valuePro, height: 157.754*valuePro)
        
        let lblTitleAddress = UILabel()
        lblTitleAddress.frame =  CGRect(x: (self.view.frame.size.width-200*valuePro)/2, y: 265*valuePro, width: 200*valuePro, height: 17*valuePro)
        lblTitleAddress.font = UIFont (name: "Avenir-Light", size:9*valuePro)
        lblTitleAddress.textColor = UIColor.init(hexString: "303030")
        lblTitleAddress.text = "www.chareety.org"
        lblTitleAddress.textAlignment = NSTextAlignment.center
        
        let lblTitle = UILabel()
        lblTitle.frame =  CGRect(x: (self.view.frame.size.width-200*valuePro)/2, y: 311*valuePro, width: 200*valuePro, height: 17*valuePro)
        lblTitle.font = UIFont (name: "Avenir", size: 14.51*valuePro)
        lblTitle.textColor = UIColor.init(hexString: "303030")
        lblTitle.text = "Abraza una causa"
        lblTitle.textAlignment = NSTextAlignment.center
        
        let btnRegister = UIButton()
        btnRegister.frame =  CGRect(x: (self.view.frame.size.width-290*valuePro)/2, y: 433*valuePro, width: 290*valuePro, height: 35*valuePro)
        btnRegister.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnRegister.setTitle("Registrarse",for: UIControlState.normal)
        btnRegister.layer.borderColor = UIColor.black.cgColor
        btnRegister.layer.cornerRadius = btnRegister.frame.size.height/2
        btnRegister.backgroundColor = UIColor.init(hexString: "00AFF1")
        btnRegister.setTitleColor(UIColor.white, for: .normal)
        btnRegister.addTarget(self, action: #selector(self.goRegister), for: UIControlEvents.touchUpInside)
        
        let btnExplorer = UIButton()
        btnExplorer.frame =  CGRect(x: (self.view.frame.size.width-290*valuePro)/2, y: 478*valuePro, width: 290*valuePro, height: 35*valuePro)
        btnExplorer.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnExplorer.setTitle("Explorar el App",for: UIControlState.normal)
        btnExplorer.layer.borderColor = UIColor.black.cgColor
        btnExplorer.layer.cornerRadius = btnExplorer.frame.size.height/2
        btnExplorer.backgroundColor = UIColor.init(hexString: "CCCCCC")
        btnExplorer.setTitleColor(UIColor.white, for: .normal)
        btnExplorer.addTarget(self, action: #selector(self.goHome), for: UIControlEvents.touchUpInside)
        
        let btnSigIn = UIButton()
        btnSigIn.frame =  CGRect(x: (self.view.frame.size.width-290*valuePro)/2, y: 523*valuePro, width: 290*valuePro, height: 35*valuePro)
        btnSigIn.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)

        btnSigIn.layer.cornerRadius = btnSigIn.frame.size.height/2
        btnSigIn.backgroundColor = UIColor.clear
        btnSigIn.setTitleColor(UIColor.init(hexString: "303030"), for: .normal)
        btnSigIn.addTarget(self, action: #selector(self.goLogIn), for: UIControlEvents.touchUpInside)

        let myMutableString = NSMutableAttributedString(
            string: "¿Ya Tienes una cuenta? Iniciar Sesion",
            attributes: [NSFontAttributeName:UIFont(
                name: "Avenir-Light",
                size: 13.0*valuePro)!])
        let atributes:NSMutableString = "¿Ya Tienes una cuenta? Iniciar Sesion"

        let rangeA:NSRange = atributes.range(of:"¿Ya Tienes una cuenta?")

        myMutableString.addAttributes([NSForegroundColorAttributeName:UIColor.init(hexString: "303030")],range: rangeA)
       
        let rangeB:NSRange = atributes.range(of:"Iniciar Sesion")

        myMutableString.addAttributes([NSForegroundColorAttributeName:UIColor.init(hexString: "00AFF1")],range: rangeB)
        
        btnSigIn.setAttributedTitle(myMutableString, for: UIControlState.normal)
        
        view.addSubview(imageView)
        view.addSubview(lblTitleAddress)
        view.addSubview(lblTitle)
        view.addSubview(btnRegister)
        view.addSubview(btnExplorer)
        view.addSubview(btnSigIn)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func goHome(sender: UIButton!) {
        getCauses(page: "1", count: "20")
//        let Item1 = HomeViewController()
//        let icon1 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "HomeOffItem"), selectedImage: #imageLiteral(resourceName: "HomeItem"))
//        Item1.tabBarItem = icon1
//        
//        let Item2 = ProfileViewController()
//        let icon2 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "ProfileOffItem"), selectedImage: #imageLiteral(resourceName: "ProfileItem"))
//        Item2.tabBarItem = icon2
//        
//        let Item3 = TermsAndContditionsViewController()
//        let icon3 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "TermsOffItem"), selectedImage: #imageLiteral(resourceName: "TermsItem"))
//        Item3.tabBarItem = icon3
//        
//        let Item4 = SettingsViewController()
//        let icon4 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "SettingOffItem"), selectedImage: #imageLiteral(resourceName: "SettingItem"))
//        Item4.tabBarItem = icon4
//        
//        let tabBarVC:UITabBarController = UITabBarController()
//        tabBarVC.viewControllers = [Item1,Item2,Item3,Item4]
//        tabBarVC.tabBar.backgroundColor = UIColor.clear
//        tabBarVC.tabBar.tintColor = UIColor.init(hexString: "00AFF1")
//        self.navigationController?.pushViewController(tabBarVC, animated: true)
    }
    func goRegister(sender: UIButton!) {
        let registerVC:RegisterViewController = RegisterViewController()
        registerVC.delegate = self
        self.present(registerVC, animated: true, completion: nil)
    }
    func goLogIn(sender: UIButton!) {
        let logInVC:LogInViewController = LogInViewController()
        logInVC.delegate = self
        self.present(logInVC, animated: true, completion: nil)
    }

    // MARK: - LogInViewControllerDelegate
    func dissmisCompletedLoadRegisterVC(){
        goRegister(sender: nil)
    }
    // MARK: - RegisterViewControllerDelegate
    func dissmisCompletedLoadLogInVC(){
        goLogIn(sender: nil)
    }
    // MARK: - API Consume
    
    func getCauses(page:String , count:String){

        var params:Dictionary <String,String> = Dictionary()
        params["p"] = page
        params["c"] = count
    
        var headers:Dictionary <String,String> = Dictionary()
        headers["Content-Type"] = "application/json"
        headers["Api-key"] = Constants.API_KEY

        ApiConsume.sharedInstance.consumeDataWithNewSession(url: "listar", path: Constants.API_URL, headers: headers, params: params, typeParams: TypeParam.urlParams, httpMethod: HTTP_METHOD.GET, notificationName: "endCauses")
        
    }

}
