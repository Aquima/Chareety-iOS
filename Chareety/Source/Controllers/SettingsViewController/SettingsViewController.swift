//
//  SettingsViewController.swift
//  Chareety
//
//  Created by Raul Quispe on 1/3/17.
//  Copyright © 2017 Chareety. All rights reserved.
//

import UIKit
enum inputSettingsType{
    case keySettingsMail
    case keySettingsName
    case keySettingsCard
}
class SettingsViewController: UIViewController, UITextFieldDelegate {

    var contentForm:UIScrollView!
    var inputSettingsList:NSMutableArray = []
    
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
        
        let btnEdit = UIButton()
        btnEdit.frame =  CGRect(x: (self.view.frame.size.width-86.68*valuePro-20*valuePro), y: 31*valuePro, width: 86.68*valuePro, height: 25.6*valuePro)
        btnEdit.titleLabel?.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        btnEdit.setTitle("Editar",for: UIControlState.normal)
        btnEdit.layer.borderColor = UIColor.black.cgColor
        btnEdit.layer.cornerRadius = btnEdit.frame.size.height/2
        btnEdit.backgroundColor = UIColor.init(hexString: "F93D53")
        btnEdit.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(btnEdit)
        
//        let lblTitle = UILabel()
//        lblTitle.frame =  CGRect(x: (view.frame.size.width-300*valuePro)/2, y: 20*valuePro, width: 300*valuePro, height: 17*valuePro)
//        lblTitle.font = UIFont (name: "Avenir-Light", size: 14.51*valuePro)
//        lblTitle.textColor = UIColor.init(hexString: "4D4D4D")
//        lblTitle.text = "Configuraciones"
//        lblTitle.textAlignment = NSTextAlignment.center
//        view.addSubview(lblTitle)

        let imageView = UIImageView(image: #imageLiteral(resourceName: "CharetyAppLogo"))
        
        imageView.frame = CGRect(x: (self.view.frame.size.width-157.541*valuePro)/2, y: 93*valuePro, width: 157.541*valuePro, height: 157.754*valuePro)
        
        let imageViewProfile = UIImageView()
        
        imageViewProfile.frame = CGRect(x: (self.view.frame.size.width-66.56*valuePro)/2, y: 138*valuePro, width: 66.56*valuePro, height: 66.56*valuePro)
        imageViewProfile.sd_setImage(with: URL.init(string: "https://pbs.twimg.com/profile_images/813356483723325440/tTolm9B9.jpg"))
        imageViewProfile.layer.cornerRadius = imageViewProfile.frame.size.height/2
        imageViewProfile.layer.masksToBounds = true
        
        
        view.addSubview(imageView)
        view.addSubview(imageViewProfile)
        
        contentForm = UIScrollView()
        contentForm.frame =  CGRect(x: (self.view.frame.size.width-320*valuePro)/2, y: 260*valuePro, width: 320*valuePro, height: 190*valuePro)
        
        let btnTapForm = UIButton()
        btnTapForm.frame = contentForm.bounds
        btnTapForm.addTarget(self, action: #selector(self.resignFirstResponderList), for: UIControlEvents.touchUpInside)
        contentForm.addSubview(btnTapForm)
        
        let lblTitleMail = UILabel()
        lblTitleMail.frame =  CGRect(x: (view.frame.size.width-290*valuePro)/2, y: 0*valuePro, width: 290*valuePro, height: 17*valuePro)
        lblTitleMail.font = UIFont (name: "Avenir-Light", size: 11*valuePro)
        lblTitleMail.textColor = UIColor.init(hexString: "808080")
        lblTitleMail.text = "Correo electronico"
        contentForm.addSubview(lblTitleMail)
        
        let inputMail = UITextField()
        inputMail.frame =  CGRect(x: (contentForm.frame.size.width-290*valuePro)/2, y: lblTitleMail.frame.size.height+5*valuePro , width: 290*valuePro, height: 35*valuePro)
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
        inputSettingsList.add(inputMail)
        
        let lblTitleName = UILabel()
        lblTitleName.frame =  CGRect(x: (view.frame.size.width-290*valuePro)/2, y: inputMail.frame.origin.y+inputMail.frame.size.height+5*valuePro, width: 290*valuePro, height: 17*valuePro)
        lblTitleName.font = UIFont (name: "Avenir-Light", size: 11*valuePro)
        lblTitleName.textColor = UIColor.init(hexString: "808080")
        lblTitleName.text = "Nombres"
        contentForm.addSubview(lblTitleName)
        
        let inputName = UITextField()
        inputName.frame =  CGRect(x: (contentForm.frame.size.width-290*valuePro)/2, y:  lblTitleName.frame.origin.y+lblTitleName.frame.size.height+5*valuePro, width: 290*valuePro, height: 35*valuePro)
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
        inputSettingsList.add(inputName)
        
        let lblTitleCard = UILabel()
        lblTitleCard.frame =  CGRect(x: (view.frame.size.width-290*valuePro)/2, y: inputName.frame.origin.y+inputName.frame.size.height+5*valuePro, width: 290*valuePro, height: 17*valuePro)
        lblTitleCard.font = UIFont (name: "Avenir-Light", size: 11*valuePro)
        lblTitleCard.textColor = UIColor.init(hexString: "808080")
        lblTitleCard.text = "Medio de Pago preferido:"
        contentForm.addSubview(lblTitleCard)
        
        let inputCard = UITextField()
        inputCard.frame =  CGRect(x: (contentForm.frame.size.width-290*valuePro)/2, y: lblTitleCard.frame.origin.y+lblTitleCard.frame.size.height+5*valuePro, width: 290*valuePro, height: 35*valuePro)
        inputCard.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        inputCard.textColor = UIColor.init(hexString: "303030")
        inputCard.backgroundColor = UIColor.init(hexString: "F2F2F2")
        inputCard.placeholder = "XXXX - XXXX - XXXX - XXXX"
        inputCard.layer.borderColor = UIColor.init(hexString: "cccccc").cgColor
        inputCard.layer.borderWidth = 1
        inputCard.textAlignment = NSTextAlignment.center
        inputCard.layer.cornerRadius = inputCard.frame.size.height/2
        inputCard.tag = inputRegisterType.keyRegisterBirthday.hashValue
        inputCard.delegate = self
        inputCard.keyboardType = UIKeyboardType.numberPad
        inputCard.returnKeyType = UIReturnKeyType.next
        contentForm.addSubview(inputCard)
        inputSettingsList.add(inputCard)
  
        view.addSubview(contentForm)
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    func goBack(sender: UIButton!) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    // MARK: - UITextField
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        switch textField.tag {
        case inputSettingsType.keySettingsMail.hashValue:
            self.contentForm.contentOffset.y = 0
            break
        case inputSettingsType.keySettingsName.hashValue:
            self.contentForm.contentOffset.y = 35*valuePro*1
            break
        case inputSettingsType.keySettingsCard.hashValue:
            self.contentForm.contentOffset.y = 35*valuePro*2
            break

        default:
            return true
        }
        return true
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        switch textField.tag {
        case inputSettingsType.keySettingsMail.hashValue:
            self.contentForm.contentOffset.y = 35*valuePro*1
            let inputText:UITextField = self.inputSettingsList[inputSettingsType.keySettingsName.hashValue] as! UITextField
            inputText.becomeFirstResponder()
            break
        case inputSettingsType.keySettingsName.hashValue:
            self.contentForm.contentOffset.y = 35*valuePro*2
            let inputText:UITextField = self.inputSettingsList[inputSettingsType.keySettingsCard.hashValue] as! UITextField
            inputText.becomeFirstResponder()
            break
        case inputSettingsType.keySettingsCard.hashValue:
//            self.contentForm.contentOffset.y = 35*valuePro*3
//            let inputText:UITextField = self.inputSettingsList[inputSettingsType.keySettingsCard.hashValue] as! UITextField
//            inputText.becomeFirstResponder()
            self.contentForm.contentOffset.y = 0
            self.resignFirstResponderList()
            break
      
        default:
            return true
        }
        return true
    }
    func resignFirstResponderList(){
        
        for inputUX in self.inputSettingsList {
            let inputTxt = inputUX as! UITextField
            inputTxt.resignFirstResponder()
        }
        self.contentForm.contentOffset.y = 0
    }


}
