//
//  LogInViewController.swift
//  Chareety
//
//  Created by Raul Quispe on 12/26/16.
//  Copyright © 2016 Chareety. All rights reserved.
//

import UIKit
enum inputType{
    case keyMail
    case keyPassword
    
}
protocol LogInViewControllerDelegate {
    func dissmisCompletedLoadRegisterVC()
}
class LogInViewController: UIViewController, UITextFieldDelegate {
    
    var delegate:LogInViewControllerDelegate?
    var contentForm:UIScrollView!
    var inputList:NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawBody()
        // Do any additional setup after loading the view.
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        let btnBack = UIButton()
        btnBack.frame =  CGRect(x:10*valuePro, y: 10*valuePro, width: 40*valuePro, height: 40*valuePro)
        btnBack.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnBack.layer.borderColor = UIColor.black.cgColor
        btnBack.layer.cornerRadius = btnBack.frame.size.height/2
        btnBack.backgroundColor = UIColor.clear
        btnBack.addTarget(self, action: #selector(self.goBack), for: UIControlEvents.touchUpInside)
        btnBack.setImage(#imageLiteral(resourceName: "btnDismiss"), for: UIControlState.normal)
        view.addSubview(btnBack)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawBody(){
        view.backgroundColor = UIColor.white
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        
        var contentView:UIView!
        contentView = UIView()
        contentView.frame =  CGRect(x: (self.view.frame.size.width-320*valuePro)/2, y: 0*valuePro, width: 320*valuePro, height: 255*valuePro)
        
        let lblTitle = UILabel()
        lblTitle.frame =  CGRect(x: (contentView.frame.size.width-100*valuePro)/2, y: 20*valuePro, width: 100*valuePro, height: 17*valuePro)
        lblTitle.font = UIFont (name: "Avenir-Light", size: 14.51*valuePro)
        lblTitle.textColor = UIColor.init(hexString: "0087D1")
        lblTitle.text = "Iniciar Sesion"
        lblTitle.textAlignment = NSTextAlignment.center
        
        let btnRegister = UIButton()
        btnRegister.frame =  CGRect(x: (contentView.frame.size.width-290*valuePro)/2, y: 37*valuePro, width: 290*valuePro, height: 35*valuePro)
        btnRegister.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        
        btnRegister.layer.cornerRadius = btnRegister.frame.size.height/2
        btnRegister.backgroundColor = UIColor.clear
        btnRegister.setTitleColor(UIColor.init(hexString: "303030"), for: .normal)
        
        let myMutableString = NSMutableAttributedString(
            string: "¿No tienes cuenta? Registrese",
            attributes: [NSFontAttributeName:UIFont(
                name: "Avenir-Light",
                size: 13.0*valuePro)!])
        let atributes:NSMutableString = "¿No tienes cuenta? Registrese"
        
        let rangeA:NSRange = atributes.range(of:"¿No tienes cuenta?")
        
        myMutableString.addAttributes([NSForegroundColorAttributeName:UIColor.init(hexString: "303030")],range: rangeA)
        
        let rangeB:NSRange = atributes.range(of:"Registrese")
        
        myMutableString.addAttributes([NSForegroundColorAttributeName:UIColor.init(hexString: "FF151F")],range: rangeB)
        
        
        btnRegister.setAttributedTitle(myMutableString, for: UIControlState.normal)
        btnRegister.addTarget(self, action: #selector(self.goRegister), for: UIControlEvents.touchUpInside)
        
        let btnFacebook = UIButton()
        btnFacebook.frame =  CGRect(x: (self.view.frame.size.width-290*valuePro)/2, y: 78*valuePro, width: 290*valuePro, height: 35*valuePro)
        btnFacebook.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnFacebook.setTitle("Iniciar con facebook",for: UIControlState.normal)
        btnFacebook.layer.borderColor = UIColor.black.cgColor
        btnFacebook.layer.cornerRadius = btnFacebook.frame.size.height/2
        btnFacebook.backgroundColor = UIColor.init(hexString: "4E71A8")
        btnFacebook.setTitleColor(UIColor.white, for: .normal)
        
        let btnTwitter = UIButton()
        btnTwitter.frame =  CGRect(x: (self.view.frame.size.width-290*valuePro)/2, y: 125*valuePro, width: 290*valuePro, height: 35*valuePro)
        btnTwitter.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnTwitter.setTitle("Iniciar con twitter",for: UIControlState.normal)
        btnTwitter.layer.borderColor = UIColor.black.cgColor
        btnTwitter.layer.cornerRadius = btnTwitter.frame.size.height/2
        btnTwitter.backgroundColor = UIColor.init(hexString: "1CB7EB")
        btnTwitter.setTitleColor(UIColor.white, for: .normal)
        
        let btnGoogle = UIButton()
        btnGoogle.frame =  CGRect(x: (self.view.frame.size.width-290*valuePro)/2, y: 174*valuePro, width: 290*valuePro, height: 35*valuePro)
        btnGoogle.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnGoogle.setTitle("Iniciar con Google+",for: UIControlState.normal)
        btnGoogle.layer.borderColor = UIColor.black.cgColor
        btnGoogle.layer.cornerRadius = btnGoogle.frame.size.height/2
        btnGoogle.backgroundColor = UIColor.init(hexString: "E3411F")
        btnGoogle.setTitleColor(UIColor.white, for: .normal)
        
        let lblTitleForm = UILabel()
        lblTitleForm.frame =  CGRect(x: 0, y: 224*valuePro, width: 320*valuePro, height: 17*valuePro)
        lblTitleForm.font = UIFont (name: "Avenir-Light", size: 14.51*valuePro)
        lblTitleForm.textColor = UIColor.init(hexString: "666666")
        lblTitleForm.textAlignment = NSTextAlignment.center
        lblTitleForm.text = "------- o ingresando su correo y contraseña -------"
        
        view.addSubview(contentView)
        contentView.addSubview(lblTitle)
        contentView.addSubview(btnRegister)
        contentView.addSubview(btnFacebook)
        contentView.addSubview(btnTwitter)
        contentView.addSubview(btnGoogle)
        contentView.addSubview(lblTitleForm)
        
        contentForm = UIScrollView()
        contentForm.frame =  CGRect(x: (self.view.frame.size.width-320*valuePro)/2, y: 255*valuePro, width: 320*valuePro, height: 314*valuePro)
        
        let inputMail = UITextField()
        inputMail.frame =  CGRect(x: (contentView.frame.size.width-290*valuePro)/2, y: 0*valuePro, width: 290*valuePro, height: 35*valuePro)
        inputMail.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        inputMail.textColor = UIColor.init(hexString: "303030")
        inputMail.backgroundColor = UIColor.init(hexString: "F2F2F2")
        inputMail.placeholder = "Correo Electronico"
        inputMail.layer.borderColor = UIColor.init(hexString: "cccccc").cgColor
        inputMail.layer.borderWidth = 1
        inputMail.textAlignment = NSTextAlignment.center
        inputMail.layer.cornerRadius = inputMail.frame.size.height/2
        inputMail.tag = inputType.keyMail.hashValue;
        inputMail.keyboardType = UIKeyboardType.emailAddress
        inputMail.returnKeyType = UIReturnKeyType.continue
        inputMail.delegate = self
        contentForm.addSubview(inputMail)
        
        inputList.add(inputMail)
        
        let inputPassword = UITextField()
        inputPassword.frame =  CGRect(x: (contentView.frame.size.width-290*valuePro)/2, y: 52*valuePro, width: 290*valuePro, height: 35*valuePro)
        inputPassword.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        inputPassword.textColor = UIColor.init(hexString: "303030")
        inputPassword.backgroundColor = UIColor.init(hexString: "F2F2F2")
        inputPassword.placeholder = "Contraseña"
        inputPassword.layer.borderColor = UIColor.init(hexString: "cccccc").cgColor
        inputPassword.layer.borderWidth = 1
        inputPassword.textAlignment = NSTextAlignment.center
        inputPassword.layer.cornerRadius = inputPassword.frame.size.height/2
        inputPassword.isSecureTextEntry = true
        inputPassword.tag = inputType.keyPassword.hashValue;
        inputPassword.delegate = self
        inputPassword.keyboardType = UIKeyboardType.default
        inputPassword.returnKeyType = UIReturnKeyType.done
        
        contentForm.addSubview(inputPassword)
        
        inputList.add(inputPassword)
        
        let btnEnter = UIButton()
        btnEnter.frame =  CGRect(x: (self.view.frame.size.width-290*valuePro)/2, y: 52*4*valuePro, width: 290*valuePro, height: 35*valuePro)
        btnEnter.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnEnter.setTitle("Iniciar Sesion",for: UIControlState.normal)
        btnEnter.layer.borderColor = UIColor.black.cgColor
        btnEnter.layer.cornerRadius = btnEnter.frame.size.height/2
        btnEnter.backgroundColor = UIColor.init(hexString: "00AFF1")
        btnEnter.setTitleColor(UIColor.white, for: .normal)
        contentForm.addSubview(btnEnter)
        
        view.addSubview(contentForm)

    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    func goBack(sender: UIButton!) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    func goRegister(sender: UIButton!) {

        self.dismiss(animated: false, completion: {
            self.contentForm = nil
            self.delegate?.dissmisCompletedLoadRegisterVC()
        })

    }
    // MARK: - 
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case inputType.keyMail.hashValue:
            self.contentForm.contentOffset.y = 0
            break
        case inputType.keyPassword.hashValue:
            self.contentForm.contentOffset.y = 35
            break
        default:
            return true
        }
        return true
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case inputType.keyMail.hashValue:
            self.contentForm.contentOffset.y = 35
            let inputText:UITextField = self.inputList[inputType.keyPassword.hashValue] as! UITextField
            inputText.becomeFirstResponder()
            break
        case inputType.keyPassword.hashValue:
            self.contentForm.contentOffset.y = 0
            textField.resignFirstResponder()
            break
        default:
            return true
        }
        return true
    }
}
