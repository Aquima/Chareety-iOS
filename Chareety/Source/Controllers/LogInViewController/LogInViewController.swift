//
//  LogInViewController.swift
//  Chareety
//
//  Created by Raul Quispe on 12/26/16.
//  Copyright © 2016 Chareety. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FBSDKLoginKit
import TwitterCore
import TwitterKit
import GoogleSignIn

enum inputType{
    case keyMail
    case keyPassword
    
}
protocol LogInViewControllerDelegate {
    func dissmisCompletedLoadRegisterVC()
    func dissmisAndGoHomeVC()
}
class LogInViewController: UIViewController, UITextFieldDelegate, GIDSignInUIDelegate  {
    
    var delegate:LogInViewControllerDelegate?
    var contentForm:UIScrollView!
    var inputList:NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
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
        
//        handle = FIRAuth.auth()?.addStateDidChangeListener() { (auth, user) in
//            // ...
//        }
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
        btnFacebook.addTarget(self, action: #selector(self.signInWithFacebook(sender:)), for: UIControlEvents.touchUpInside)

        let btnTwitter = UIButton()
        btnTwitter.frame =  CGRect(x: (self.view.frame.size.width-290*valuePro)/2, y: 125*valuePro, width: 290*valuePro, height: 35*valuePro)
        btnTwitter.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnTwitter.setTitle("Iniciar con twitter",for: UIControlState.normal)
        btnTwitter.layer.borderColor = UIColor.black.cgColor
        btnTwitter.layer.cornerRadius = btnTwitter.frame.size.height/2
        btnTwitter.backgroundColor = UIColor.init(hexString: "1CB7EB")
        btnTwitter.setTitleColor(UIColor.white, for: .normal)
        btnTwitter.addTarget(self, action: #selector(self.signInWithTwitter), for: UIControlEvents.touchUpInside)
        
        let btnGoogle = UIButton()
        btnGoogle.frame =  CGRect(x: (self.view.frame.size.width-290*valuePro)/2, y: 174*valuePro, width: 290*valuePro, height: 35*valuePro)
        btnGoogle.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnGoogle.setTitle("Iniciar con Google+",for: UIControlState.normal)
        btnGoogle.layer.borderColor = UIColor.black.cgColor
        btnGoogle.layer.cornerRadius = btnGoogle.frame.size.height/2
        btnGoogle.backgroundColor = UIColor.init(hexString: "E3411F")
        btnGoogle.setTitleColor(UIColor.white, for: .normal)
        btnGoogle.addTarget(self, action: #selector(self.signWithGoogle(sender:)), for: UIControlEvents.touchUpInside)

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
        
        let btnTapForm = UIButton()
        btnTapForm.frame = contentForm.bounds
        btnTapForm.addTarget(self, action: #selector(self.resignFirstResponderList), for: UIControlEvents.touchUpInside)
        contentForm.addSubview(btnTapForm)
        
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
        btnEnter.addTarget(self, action: #selector(self.loginManualValidate), for: UIControlEvents.touchUpInside)

        contentForm.addSubview(btnEnter)
        
        view.addSubview(contentForm)

    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewWillDisappear(_ animated: Bool) {
        resignFirstResponderList()
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
    // MARK: - UITextField
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        switch textField.tag {
        case inputType.keyMail.hashValue:
            self.contentForm.contentOffset.y = 0
            break
        case inputType.keyPassword.hashValue:
            self.contentForm.contentOffset.y = 35*valuePro
            break
        default:
            return true
        }
        return true
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        switch textField.tag {
        case inputType.keyMail.hashValue:
            self.contentForm.contentOffset.y = 35*valuePro
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
    func resignFirstResponderList(){

        for inputUX in self.inputList {
            let inputTxt = inputUX as! UITextField
            inputTxt.resignFirstResponder()
        }
        self.contentForm.contentOffset.y = 0
    }
    func loginManualValidate(sender:UIButton)  {
        let inputTextMail:UITextField = self.inputList[inputType.keyMail.hashValue] as! UITextField
        let inputTextPassword:UITextField = self.inputList[inputType.keyPassword.hashValue] as! UITextField

        if inputTextMail.text != "" && inputTextPassword.text != "" {

            self.logInManual(email: inputTextMail.text!, password: inputTextPassword.text! )
            sender.isHidden = true
        }else{

            sender.isHidden = false
        }
    }
    // MARK: - API Consume
    func logInManual(email:String , password:String){
        
        let notificationName = Notification.Name("endLogIn")
        NotificationCenter.default.addObserver(self, selector: #selector(self.endLogIn), name: notificationName, object: nil)

        var params:Dictionary <String,String> = Dictionary()
        params["email"] = email
        params["contrasenia"] = password
        
        var headers:Dictionary <String,String> = Dictionary()
        headers["Content-Type"] = "application/json"
        headers["Api-key"] = Constants.API_KEY
        
        ApiConsume.sharedInstance.consumeDataWithNewSession(url: "LogIn", path: Constants.API_URL, headers: headers, params: params, typeParams: TypeParam.jsonBody, httpMethod: HTTP_METHOD.POST, notificationName: "endLogIn")
        
    }
    
    func logInRedSocial(type:String , uid:String, token:String){
        
        let notificationName = Notification.Name("endLogIn")
        NotificationCenter.default.addObserver(self, selector: #selector(self.endLogIn), name: notificationName, object: nil)
        
        var params:Dictionary <String,String> = Dictionary()
        params["typeSocialNetworking"] = type
        params["uidNetworkingSocial"] = uid
        params["tokenSocialNetworking"] = token
        
        var headers:Dictionary <String,String> = Dictionary()
        headers["Content-Type"] = "application/json"
        headers["Api-key"] = Constants.API_KEY
        
        ApiConsume.sharedInstance.consumeDataWithNewSession(url: "LogIn", path: Constants.API_URL, headers: headers, params: params, typeParams: TypeParam.jsonBody, httpMethod: HTTP_METHOD.POST, notificationName: "endLogIn")
        
    }

    func endLogIn(notification:Notification){
        NotificationCenter.default.removeObserver(self, name: notification.name, object: nil)
        DispatchQueue.main.async(execute: {
             if let dictionary = notification.object as? [String: Any] {
                // validate token != nil
                if dictionary["tokenChareety"] != nil {
                    let valueToSave = dictionary["tokenChareety"]
                    UserDefaults.standard.set(valueToSave, forKey: "tokenChareety")
                    UserDefaults.standard.synchronize()
                    
                    self.dismiss(animated: false, completion: {
                    self.contentForm = nil
                    self.delegate?.dissmisAndGoHomeVC()
                        
                    })
                }else{
                    let alert = UIAlertController(title: "Chareety.org", message: "Contraseña incorrecta o usuario no registrado", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }
                    
            }
         
        })
    }
    // MARK : Actions
    func signWithGoogle(sender:UIButton) {
       GIDSignIn.sharedInstance().signIn()
    }
    func signInWithFacebook(sender: UIButton) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self, handler: { (result, error) -> Void in

            if error != nil {
                NSLog("Process error")
            }
            else if (result?.isCancelled)! {
                NSLog("Cancelled")
            }
            else {
                NSLog("Logged in")
                self.logInRedSocial(type: "1", uid: "ios.developer.qm", token: (result?.token.tokenString)!)
            }

        })
    }
    func signInWithTwitter(sender: UIButton) {
        Twitter.sharedInstance().logIn(completion: { session, error in
            if (session != nil) {
                let authToken = (session?.authToken)! + "," + (session?.authTokenSecret)! + "," + (session?.userName)!
                let authUID = session?.userID
                self.logInRedSocial(type: "0", uid: authUID!, token: (authToken))
            } else {
                // ...
            }
        })
        
    }
    // MARK: Google
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!){
        let authToken = signIn.currentUser.authentication.accessToken// + "," + signIn.currentUser.profile.imageURL(withDimension: 120).absoluteString
        let authUID = signIn.currentUser.userID
        self.logInRedSocial(type: "2", uid: authUID!, token: (authToken)!)
    }
}
