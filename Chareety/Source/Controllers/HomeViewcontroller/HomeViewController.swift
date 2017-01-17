//
//  HomeViewController.swift
//  Chareety
//
//  Created by Raul Quispe on 12/26/16.
//  Copyright © 2016 Chareety. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    var managedObjectContext: NSManagedObjectContext? = nil
     // MARK: - Properties Data
    var currentData : NSMutableArray = []
    var tableView: UITableView!
    var progressView: UIView!
    
    var btnActives:UIButton!
    var btnPast:UIButton!
    var currentType = 1
    
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
        let sectionInfo = self.fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.fetchedResultsController.sections?.count ?? 0
    }
    
    // MARK: - TableView Delegate
    public func tableView(_ tableView:              UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CauseTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CauseTableViewCell") as! CauseTableViewCell
        let cause:EntityCause = self.fetchedResultsController.object(at: indexPath)
        cell.loadwithEntity(entity: cause)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let valuePro:CGFloat  = CGFloat(NSNumber.getPropotionalValueDevice())
        return 179*valuePro;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Do here
        
        self.navigationController?.pushViewController(DetailCauseViewController(), animated: true)
    }
    // MARK: - TableView
    override func viewWillAppear(_ animated: Bool) {

        
        
    }
    // MARK: - Fetched results controller
    
    var fetchedResultsController: NSFetchedResultsController<EntityCause> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<EntityCause> = EntityCause.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 5
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: false)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchRequest.predicate = NSPredicate(format: "type == %d", currentType)
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: Storage.shared.context, sectionNameKeyPath: nil, cacheName: "Chareety")
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    var _fetchedResultsController: NSFetchedResultsController<EntityCause>? = nil
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            self.tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            self.tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        default:
            return
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        default:
            break
        }
        //   case .update:
        //self.configureCell(tableView.cellForRow(at: indexPath!)!, withEvent: anObject as! EntityCause)
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.endUpdates()
    }

    // MARK: - Call APi Consume
    
}
