//
//  SplashviewControllerViewController.swift
//  Chareety
//
//  Created by Raul Quispe on 12/22/16.
//  Copyright © 2016 Chareety. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class SplashviewControllerViewController: UIViewController {
    
    var activityIndicatorView:NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawBody()
        // Do any additional setup after loading the view.
       
    }
    func drawBody(){
        
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        
        let frame =  CGRect(x: (self.view.frame.size.width-25*valuePro)/2, y:100*valuePro + (self.view.frame.size.height)/2, width: 25*valuePro, height: 25*valuePro)
        activityIndicatorView = NVActivityIndicatorView(frame: frame,
                                                        type: NVActivityIndicatorType(rawValue: 1)!)
        activityIndicatorView.color = UIColor.init(hexString: "303030")
        activityIndicatorView.startAnimating()
      
        
        view.backgroundColor = UIColor.white
  
        let imageView = UIImageView(image: #imageLiteral(resourceName: "CharetyAppLogo"))
        
        imageView.frame = CGRect(x: (self.view.frame.size.width-157.541*valuePro)/2, y: 94.951*valuePro, width: 157.541*valuePro, height: 157.754*valuePro)
        
        let lblTitleAddress = UILabel()
        lblTitleAddress.frame =  CGRect(x: (self.view.frame.size.width-200*valuePro)/2, y: 265*valuePro, width: 200*valuePro, height: 17*valuePro)
        lblTitleAddress.font = UIFont (name: "Avenir-Light", size:9*valuePro)
        lblTitleAddress.textColor = UIColor.init(hexString: "303030")
        lblTitleAddress.text = "www.chareety.org"
        lblTitleAddress.textAlignment = NSTextAlignment.center
        
        view.addSubview(lblTitleAddress)
        view.addSubview(imageView)
        view.addSubview(activityIndicatorView)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        activityIndicatorView.startAnimating()
        
        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            // Your code with delay
            self.navigationController?.pushViewController(IntroViewController(), animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
