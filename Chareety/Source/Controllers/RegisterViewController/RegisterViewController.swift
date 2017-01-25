//
//  RegisterViewController.swift
//  Chareety
//
//  Created by Raul Quispe on 12/25/16.
//  Copyright © 2016 Chareety. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import TwitterCore
import TwitterKit
import GoogleSignIn

enum inputRegisterType{
    case keyRegisterMail
    case keyRegisterName
    case keyRegisterBirthday
    case keyRegisterPassword
}

protocol RegisterViewControllerDelegate {
    func dissmisCompletedLoadLogInVC()
    func dissmisAndGoHomeVC()
}

class RegisterViewController: UIViewController, UITextFieldDelegate, FBSDKLoginButtonDelegate, GIDSignInUIDelegate {
    
    var delegate:RegisterViewControllerDelegate?
    var contentForm:UIScrollView!
    var inputRegisterList:NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
      //  GIDSignIn.sharedInstance().signOut()
        drawBody()
        // Use Firebase library to configure APIs
//        FIRApp.configure()
//        
//        let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
//        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
//            // ...
//        }
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
        lblTitle.text = "Registro"
        lblTitle.textAlignment = NSTextAlignment.center
        
        let btnSigIn = UIButton()
        btnSigIn.frame =  CGRect(x: (contentView.frame.size.width-290*valuePro)/2, y: 37*valuePro, width: 290*valuePro, height: 35*valuePro)
        btnSigIn.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        
        btnSigIn.layer.cornerRadius = btnSigIn.frame.size.height/2
        btnSigIn.backgroundColor = UIColor.clear
        btnSigIn.setTitleColor(UIColor.init(hexString: "303030"), for: .normal)
        
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
        btnSigIn.addTarget(self, action: #selector(self.goLogIn), for: UIControlEvents.touchUpInside)


        let btnFacebook = UIButton()
       // let btnFacebook = FBSDKLoginButton()
        btnFacebook.frame =  CGRect(x: (self.view.frame.size.width-290*valuePro)/2, y: 78*valuePro, width: 290*valuePro, height: 35*valuePro)
        btnFacebook.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnFacebook.setTitle("Registrarse con facebook",for: UIControlState.normal)
        btnFacebook.layer.borderColor = UIColor.black.cgColor
        btnFacebook.layer.cornerRadius = btnFacebook.frame.size.height/2
        btnFacebook.layer.masksToBounds = true
        btnFacebook.backgroundColor = UIColor.init(hexString: "4E71A8")
        btnFacebook.setTitleColor(UIColor.white, for: .normal)
        btnFacebook.addTarget(self, action: #selector(self.signInWithFacebook(sender:)), for: UIControlEvents.touchUpInside)
       // btnFacebook.delegate = self
        
        
        let btnTwitter = UIButton()
        btnTwitter.setImage(nil, for: .normal)
        btnTwitter.frame =  CGRect(x: (self.view.frame.size.width-290*valuePro)/2, y: 125*valuePro, width: 290*valuePro, height: 35*valuePro)
        btnTwitter.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnTwitter.setTitle("Registrarse con twitter",for: UIControlState.normal)
        btnTwitter.layer.borderColor = UIColor.black.cgColor
        btnTwitter.layer.cornerRadius = btnTwitter.frame.size.height/2
        btnTwitter.backgroundColor = UIColor.init(hexString: "1CB7EB")
        btnTwitter.setTitleColor(UIColor.white, for: .normal)
        btnTwitter.addTarget(self, action: #selector(self.signInWithTwitter), for: UIControlEvents.touchUpInside)
        
        let btnGoogle = UIButton()
        btnGoogle.frame =  CGRect(x: (self.view.frame.size.width-290*valuePro)/2, y: 174*valuePro, width: 290*valuePro, height: 35*valuePro)
        btnGoogle.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnGoogle.setTitle("Registrarse con Google+",for: UIControlState.normal)
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
        lblTitleForm.text = "---------- o registrate con tu email ----------"
        
        view.addSubview(contentView)
        contentView.addSubview(lblTitle)
        contentView.addSubview(btnSigIn)
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
        inputMail.tag = inputRegisterType.keyRegisterMail.hashValue
        inputMail.delegate = self
        inputMail.keyboardType = UIKeyboardType.emailAddress
        inputMail.returnKeyType = UIReturnKeyType.next
        contentForm.addSubview(inputMail)
        inputRegisterList.add(inputMail)
        
        let inputName = UITextField()
        inputName.frame =  CGRect(x: (contentView.frame.size.width-290*valuePro)/2, y: 52*valuePro, width: 290*valuePro, height: 35*valuePro)
        inputName.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        inputName.textColor = UIColor.init(hexString: "303030")
        inputName.backgroundColor = UIColor.init(hexString: "F2F2F2")
        inputName.placeholder = "Nombre"
        inputName.layer.borderColor = UIColor.init(hexString: "cccccc").cgColor
        inputName.layer.borderWidth = 1
        inputName.textAlignment = NSTextAlignment.center
        inputName.layer.cornerRadius = inputName.frame.size.height/2
        inputName.tag = inputRegisterType.keyRegisterName.hashValue
        inputName.delegate = self
        inputName.keyboardType = UIKeyboardType.default
        inputName.returnKeyType = UIReturnKeyType.next
        contentForm.addSubview(inputName)
        inputRegisterList.add(inputName)
        
        let inputBirthday = UITextField()
        inputBirthday.frame =  CGRect(x: (contentView.frame.size.width-290*valuePro)/2, y: 52*2*valuePro, width: 290*valuePro, height: 35*valuePro)
        inputBirthday.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        inputBirthday.textColor = UIColor.init(hexString: "303030")
        inputBirthday.backgroundColor = UIColor.init(hexString: "F2F2F2")
        inputBirthday.placeholder = "Dia/Mes/Año"
        inputBirthday.layer.borderColor = UIColor.init(hexString: "cccccc").cgColor
        inputBirthday.layer.borderWidth = 1
        inputBirthday.textAlignment = NSTextAlignment.center
        inputBirthday.layer.cornerRadius = inputBirthday.frame.size.height/2
        inputBirthday.tag = inputRegisterType.keyRegisterBirthday.hashValue
        inputBirthday.delegate = self
        inputBirthday.keyboardType = UIKeyboardType.numberPad
        inputBirthday.returnKeyType = UIReturnKeyType.next
        contentForm.addSubview(inputBirthday)
        inputRegisterList.add(inputBirthday)
        
        let inputPassword = UITextField()
        inputPassword.frame =  CGRect(x: (contentView.frame.size.width-290*valuePro)/2, y: 52*3*valuePro, width: 290*valuePro, height: 35*valuePro)
        inputPassword.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        inputPassword.textColor = UIColor.init(hexString: "303030")
        inputPassword.backgroundColor = UIColor.init(hexString: "F2F2F2")
        inputPassword.placeholder = "Contraseña"
        inputPassword.layer.borderColor = UIColor.init(hexString: "cccccc").cgColor
        inputPassword.layer.borderWidth = 1
        inputPassword.textAlignment = NSTextAlignment.center
        inputPassword.layer.cornerRadius = inputPassword.frame.size.height/2
        inputPassword.isSecureTextEntry = true
        inputPassword.tag = inputRegisterType.keyRegisterPassword.hashValue
        inputPassword.delegate = self
        contentForm.addSubview(inputPassword)
        inputRegisterList.add(inputPassword)
        
        let btnCreateAccount = UIButton()
        btnCreateAccount.frame =  CGRect(x: (self.view.frame.size.width-290*valuePro)/2, y: 52*4*valuePro, width: 290*valuePro, height: 35*valuePro)
        btnCreateAccount.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnCreateAccount.setTitle("Crear mi cuenta",for: UIControlState.normal)
        btnCreateAccount.layer.borderColor = UIColor.black.cgColor
        btnCreateAccount.layer.cornerRadius = btnCreateAccount.frame.size.height/2
        btnCreateAccount.backgroundColor = UIColor.init(hexString: "8BCD1F")
        btnCreateAccount.setTitleColor(UIColor.white, for: .normal)
        btnCreateAccount.addTarget(self, action: #selector(self.registerManualValidate), for: UIControlEvents.touchUpInside)
        contentForm.addSubview(btnCreateAccount)
        
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
    func goLogIn(sender: UIButton!) {
        
        self.dismiss(animated: false, completion: {
            self.delegate?.dissmisCompletedLoadLogInVC()
        })
        
    }
    // MARK: - UITextField
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        switch textField.tag {
        case inputRegisterType.keyRegisterMail.hashValue:
            self.contentForm.contentOffset.y = 0
            break
        case inputRegisterType.keyRegisterName.hashValue:
            self.contentForm.contentOffset.y = 35*valuePro*1
            break
        case inputRegisterType.keyRegisterBirthday.hashValue:
            self.contentForm.contentOffset.y = 35*valuePro*2
            break
        case inputRegisterType.keyRegisterPassword.hashValue:
            self.contentForm.contentOffset.y = 35*valuePro*3
            break
        default:
            return true
        }
        return true
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        switch textField.tag {
        case inputRegisterType.keyRegisterMail.hashValue:
            self.contentForm.contentOffset.y = 35*valuePro*1
            let inputText:UITextField = self.inputRegisterList[inputRegisterType.keyRegisterName.hashValue] as! UITextField
            inputText.becomeFirstResponder()
            break
        case inputRegisterType.keyRegisterName.hashValue:
            self.contentForm.contentOffset.y = 35*valuePro*2
            let inputText:UITextField = self.inputRegisterList[inputRegisterType.keyRegisterBirthday.hashValue] as! UITextField
            inputText.becomeFirstResponder()
            break
        case inputRegisterType.keyRegisterBirthday.hashValue:
            self.contentForm.contentOffset.y = 35*valuePro*3
            let inputText:UITextField = self.inputRegisterList[inputRegisterType.keyRegisterPassword.hashValue] as! UITextField
            inputText.becomeFirstResponder()
            break
        case inputRegisterType.keyRegisterPassword.hashValue:
            self.contentForm.contentOffset.y = 0
            textField.resignFirstResponder()
            break
        default:
            return true
        }
        return true
    }
    func resignFirstResponderList(){
        
        for inputUX in self.inputRegisterList {
            let inputTxt = inputUX as! UITextField
            inputTxt.resignFirstResponder()
        }
        self.contentForm.contentOffset.y = 0
    }
// MARK : FACEBOOK
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        // ...
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!){
        
    }

    // MARK: Google
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!){
//        let authToken = signIn.currentUser.authentication.accessToken //+ "," + signIn.currentUser.profile.imageURL(withDimension: 120).absoluteString
//        let authUID = signIn.currentUser.userID
//        self.registerRedSocial(type: "2", uid: authUID!, token: (authToken)!)
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
                 self.registerRedSocial(type: "1", uid: "ios.developer.qm", token: (result?.token.tokenString)!)
            }

        })
    }
    func signInWithTwitter(sender: UIButton) {
        Twitter.sharedInstance().logIn(completion: { session, error in
            if (session != nil) {
              let authToken = session?.authToken
               let authUID = session?.userID

                self.registerRedSocial(type: "0", uid: authUID!, token: (authToken)!)
            } else {
            // ...
            }
        })

    }
    func registerManualValidate(sender:UIButton)  {
        let inputTextMail:UITextField = self.inputRegisterList[inputRegisterType.keyRegisterMail.hashValue] as! UITextField
        let inputTextName:UITextField = self.inputRegisterList[inputRegisterType.keyRegisterName.hashValue] as! UITextField
        let inputTextBirthday:UITextField = self.inputRegisterList[inputRegisterType.keyRegisterBirthday.hashValue] as! UITextField
        let inputTextPassword:UITextField = self.inputRegisterList[inputRegisterType.keyRegisterPassword.hashValue] as! UITextField

        if inputTextMail.text != "" && inputTextName.text != "" && inputTextBirthday.text != "" && inputTextPassword.text != "" {
            self.registerManual(name: inputTextName.text!, email: inputTextMail.text!, password: inputTextPassword.text!, date: inputTextBirthday.text!)

            sender.isHidden = true
        }else{

            sender.isHidden = false
        }
    }

    // MARK: - API Consume
    func registerManual(name:String , email:String, password:String, date:String){

        let notificationName = Notification.Name("endRegisterUser")
        NotificationCenter.default.addObserver(self, selector: #selector(self.endRegister), name: notificationName, object: nil)

        var params:Dictionary <String,String> = Dictionary()
        params["nombre"] = name
        params["email"] = email
        params["contrasenia"] = password
        params["fechaNacimiento"] = date

        var headers:Dictionary <String,String> = Dictionary()
        headers["Content-Type"] = "application/json"
        headers["Api-key"] = Constants.API_KEY

        ApiConsume.sharedInstance.consumeDataWithNewSession(url: "RegisterUser", path: Constants.API_URL, headers: headers, params: params, typeParams: TypeParam.jsonBody, httpMethod: HTTP_METHOD.POST, notificationName: "endRegisterUser")

    }
    func registerRedSocial(type:String , uid:String, token:String){
        
        let notificationName = Notification.Name("endRegisterUser")
        NotificationCenter.default.addObserver(self, selector: #selector(self.endRegister), name: notificationName, object: nil)

        var params:Dictionary <String,String> = Dictionary()
        params["typeSocialNetworking"] = type
        params["uidNetworkingSocial"] = uid
        params["tokenSocialNetworking"] = token

        var headers:Dictionary <String,String> = Dictionary()
        headers["Content-Type"] = "application/json"
        headers["Api-key"] = Constants.API_KEY
        
        ApiConsume.sharedInstance.consumeDataWithNewSession(url: "RegisterUser", path: Constants.API_URL, headers: headers, params: params, typeParams: TypeParam.jsonBody, httpMethod: HTTP_METHOD.POST, notificationName: "endRegisterUser")
        
    }
    func endRegister(notification:Notification){

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

}
