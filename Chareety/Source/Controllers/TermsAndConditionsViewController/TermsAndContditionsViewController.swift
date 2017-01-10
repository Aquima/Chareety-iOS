//
//  TermsAndContditionsViewController.swift
//  Chareety
//
//  Created by Raul Quispe on 1/3/17.
//  Copyright © 2017 Chareety. All rights reserved.
//

import UIKit

class TermsAndContditionsViewController: UIViewController {

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
        lblTitle.text = "Chareety.org"
        lblTitle.textAlignment = NSTextAlignment.center
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "CharetyAppLogo"))
        
        imageView.frame = CGRect(x: (self.view.frame.size.width-157.541*valuePro)/2, y: 69*valuePro, width: 157.541*valuePro, height: 157.754*valuePro)
        
        let lblTitleTerms = UILabel()
        lblTitleTerms.frame =  CGRect(x: (view.frame.size.width-300*valuePro)/2, y: 253*valuePro, width: 300*valuePro, height: 17*valuePro)
        lblTitleTerms.font = UIFont (name: "Avenir-Light", size: 13*valuePro)
        lblTitleTerms.textColor = UIColor.init(hexString: "1A1A1A")
        lblTitleTerms.text = "Terminos & Condiciones"
        lblTitleTerms.textAlignment = NSTextAlignment.center
        
        let txtvTermsContent = UITextView()
        txtvTermsContent.frame =  CGRect(x: (view.frame.size.width-280*valuePro)/2, y: 280*valuePro, width: 280*valuePro, height: 231*valuePro)
        txtvTermsContent.font = UIFont (name: "Avenir-Light", size: 12*valuePro)
        txtvTermsContent.textColor = UIColor.init(hexString: "4D4D4D")
        txtvTermsContent.text = "Terminos & Condiciones"
        txtvTermsContent.textAlignment = NSTextAlignment.center
        txtvTermsContent.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam eratvolutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl utaliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit essemolestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odiodignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.Lorem ipsum dolor sit amet, cons ectetuer adipiscing elit, Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit prae Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam eratvolutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl utaliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit essemolestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odiodignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.Lorem ipsum dolor sit amet, cons ectetuer adipiscing elit, Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit prae"
        
        
        view.addSubview(imageView)
        view.addSubview(lblTitle)
        view.addSubview(lblTitleTerms)
        view.addSubview(txtvTermsContent)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    func goBack(sender: UIButton!) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

}
