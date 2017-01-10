//
//  HomeViewController.swift
//  Chareety
//
//  Created by Raul Quispe on 12/26/16.
//  Copyright © 2016 Chareety. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

     // MARK: - Properties Data
    var currentData : NSMutableArray = []
    var tableView: UITableView!
    
    var btnActives:UIButton!
    var btnPast:UIButton!
    
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
        btnBack.setImage(#imageLiteral(resourceName: "btnBack"), for: UIControlState.normal)
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
        lblTitle.frame =  CGRect(x: (contentView.frame.size.width-300*valuePro)/2, y: 20*valuePro, width: 300*valuePro, height: 17*valuePro)
        lblTitle.font = UIFont (name: "Avenir-Light", size: 14.51*valuePro)
        lblTitle.textColor = UIColor.init(hexString: "4D4D4D")
        lblTitle.text = "Abraza una Causa"
        lblTitle.textAlignment = NSTextAlignment.center
        
        view.addSubview(contentView)
        contentView.addSubview(lblTitle)
        
        self.tableView = UITableView(frame: CGRect(x:  (self.view.frame.size.width-293*valuePro)/2, y: 85*valuePro, width:293*valuePro, height: self.view.frame.size.height-114-(self.tabBarController?.tabBar.frame.size.height)!))
        self.tableView.backgroundColor = UIColor.init(hexString: "ffffff")
        self.tableView.separatorColor = UIColor.clear
        
        self.tableView.register(UINib(nibName: "CauseTableViewCell", bundle: nil), forCellReuseIdentifier: "CauseTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        
        btnActives = UIButton(frame: CGRect(x: tableView.frame.origin.x, y: tableView.frame.origin.y-30*valuePro, width: tableView.frame.size.width/2, height: 30*valuePro))
        btnActives.backgroundColor = UIColor.init(hexString: "00AFF1")
        btnActives.layer.borderColor = UIColor.init(hexString: "00AFF1").cgColor
        btnActives.layer.borderWidth = 0.5
        btnActives.setTitleColor(UIColor.white, for: UIControlState.normal)
        btnActives.setTitle("Causas Activas", for: UIControlState.normal)
        btnActives.titleLabel?.font = UIFont (name: "Avenir-Light", size: 12*valuePro)
        self.view.addSubview(btnActives)
        
        btnPast = UIButton(frame: CGRect(x: tableView.frame.origin.x+tableView.frame.size.width/2, y: tableView.frame.origin.y-30*valuePro, width: tableView.frame.size.width/2, height: 30*valuePro))
        btnPast.backgroundColor = UIColor.white
        btnPast.layer.borderWidth = 0.5
        btnPast.layer.borderColor = UIColor.init(hexString: "00AFF1").cgColor
        btnPast.setTitleColor(UIColor.init(hexString: "00AFF1"), for: UIControlState.normal)
        btnPast.setTitle("Causas Pasadas", for: UIControlState.normal)
        btnPast.titleLabel?.font = UIFont (name: "Avenir-Light", size: 12*valuePro)
        self.view.addSubview(btnPast)
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    func goBack(sender: UIButton!) {
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    // MARK: - TableView Datasource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 30//self.currentData.count
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        //Defaul is 1
        return 1//self.currentData.count
    }
    
    // MARK: - TableView Delegate
    public func tableView(_ tableView:              UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CauseTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CauseTableViewCell") as! CauseTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        return 179*valuePro;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Do here
        
    }
    // MARK: - TableView
    override func viewWillAppear(_ animated: Bool) {

        
        
    }
   
    // MARK: - Call APi Consume
    
}
