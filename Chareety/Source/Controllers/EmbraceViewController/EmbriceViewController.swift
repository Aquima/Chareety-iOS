//
//  EmbriceViewController.swift
//  Chareety
//
//  Created by Raul  on 1/17/17.
//  Copyright © 2017 Chareety. All rights reserved.
//

import UIKit

class EmbriceViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{

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
        
        imageView.frame = CGRect(x: (self.view.frame.size.width-157.867*valuePro)/2, y: 29*valuePro, width: 157.867*valuePro, height: 161.824*valuePro)
        self.view.addSubview(imageView)
        
        let lblTitle = UILabel()
        let lblTitle2 = UILabel()
        lblTitle.frame =  CGRect(x: (self.view.frame.size.width-280*valuePro)/2, y: 223.59*valuePro, width: 280*valuePro, height: 38*valuePro)
        lblTitle.font = UIFont (name: "Avenir", size: 14.85*valuePro)
        lblTitle.textColor = UIColor.init(hexString: "333333")
        lblTitle.text = "Abrazan esta causa:"
        lblTitle.textAlignment = NSTextAlignment.center
        lblTitle2.frame =  CGRect(x: (self.view.frame.size.width-280*valuePro)/2, y: 258*valuePro, width: 280*valuePro, height: 38*valuePro)
        lblTitle2.font = UIFont (name: "Avenir", size: 13.98*valuePro)
        lblTitle2.textColor = UIColor.init(hexString: "333333")
        lblTitle2.text = "459 Personas"
        lblTitle2.textAlignment = NSTextAlignment.center
        self.view.addSubview(lblTitle)
        self.view.addSubview(lblTitle2)
        
        
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: (self.view.frame.size.width-294.4*valuePro)/2, y: 291.33*valuePro , width: 294.4*valuePro, height: 262.9*valuePro - (self.tabBarController?.tabBar.frame.height)!), collectionViewLayout: flowLayout)
        //   self.tableView.register(UINib(nibName: "CauseTableViewCell", bundle: nil), forCellReuseIdentifier: "CauseTableViewCell")
        collectionView.register(UINib(nibName: "UserCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UserCollectionViewCell")
        //collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        
        self.view.addSubview(collectionView)

        
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionViewCell", for: indexPath as IndexPath)
        
        cell.backgroundColor = UIColor.green
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        return CGSize(width: (267.4/3)*valuePro, height: (267.4/3)*valuePro)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    // MARK: - Actions
    func goBack(sender: UIButton!) {
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    
    
}
