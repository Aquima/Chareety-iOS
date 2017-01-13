//
//  Storage.swift
//
//  Created by Grigory Avdyushin on 30.06.16.
//  Copyright © 2016 Grigory Avdyushin. All rights reserved.
//
import UIKit
import CoreData
import Foundation
/// NSPersistentStoreCoordinator extension
extension NSPersistentStoreCoordinator {
    
    /// NSPersistentStoreCoordinator error types
    public enum CoordinatorError: Error {
        /// .momd file not found
        case modelFileNotFound
        /// NSManagedObjectModel creation fail
        case modelCreationError
        /// Gettings document directory fail
        case storePathNotFound
    }
    
    /// Return NSPersistentStoreCoordinator object
    static func coordinator(name: String) throws -> NSPersistentStoreCoordinator? {
        
        guard let modelURL = Bundle.main.url(forResource: name, withExtension: "momd") else {
            throw CoordinatorError.modelFileNotFound
        }
        
        guard let model = NSManagedObjectModel(contentsOf: modelURL) else {
            throw CoordinatorError.modelCreationError
        }
        
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        guard let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
            throw CoordinatorError.storePathNotFound
        }
        
        do {
            let url = documents.appendingPathComponent("\(name).sqlite")
            let options = [ NSMigratePersistentStoresAutomaticallyOption : true,
                            NSInferMappingModelAutomaticallyOption : true ]
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: options)
        } catch {
            throw error
        }
        
        return coordinator
    }
}

struct Storage {
    
    static var shared = Storage()
    
    @available(iOS 10.0, *)
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Chareety")
        container.loadPersistentStores { (storeDescription, error) in
            print("CoreData: Inited \(storeDescription)")
            guard error == nil else {
                print("CoreData: Unresolved error \(error)")
                return
            }
        }
        return container
    }()
    
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        do {
            return try NSPersistentStoreCoordinator.coordinator(name: "Chareety")
        } catch {
            print("CoreData: Unresolved error \(error)")
        }
        return nil
    }()
    
    private lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: Public methods
    
    enum SaveStatus {
        case saved, rolledBack, hasNoChanges
    }
    
    var context: NSManagedObjectContext {
        mutating get {
            if #available(iOS 10.0, *) {
                return persistentContainer.viewContext
            } else {
                return managedObjectContext
            }
        }
    }
    
    mutating func save() -> SaveStatus {
        if context.hasChanges {
            do {
                try context.save()
                return .saved
            } catch {
                context.rollback()
                return .rolledBack
            }
        }
        return .hasNoChanges
    }
    func deleteAllData(entity: String)
    {
        // let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = Storage.shared.context
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        
        do
        {
            let results = try managedContext.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                managedContext.delete(managedObjectData)
            }
        } catch let error as NSError {
            print("Detele all data in \(entity) error : \(error) \(error.userInfo)")
        }
    }
    // MARK: - SAVE
    func saveCauseForId(uid:String,nameEntity:String,item:Dictionary<String, String>) -> (EntityCause, Bool){
   
        let moc =  Storage.shared.context
        let benefitFetch = NSFetchRequest<NSFetchRequestResult>(entityName: nameEntity)
        benefitFetch.predicate = NSPredicate(format: "id == %@", uid)
        do {
            
            let list = try moc.fetch(benefitFetch) as! [EntityCause]
            if list.count > 0 {
                //no created
                let currentEntity:EntityCause = list.last!
                return (currentEntity,true)
            }else{
                //create now
                var currentEntity:EntityCause!
                if #available(iOS 10.0, *) {
                    currentEntity = EntityCause(context: Storage.shared.context)
                } else {
                    // Fallback on earlier versions
                    let entityDescription = NSEntityDescription.entity(forEntityName: nameEntity,
                                                                       in: Storage.shared.context)
                    currentEntity = EntityCause(entity: entityDescription!,
                                                   insertInto: Storage.shared.context)
                }
                //save data
                currentEntity.id = uid
                currentEntity.title = item["title"]
                currentEntity.urlImageCause = item["url_image_cause"]
                currentEntity.type = Int16(item["type"]!)!
                currentEntity.total = item["total"]
                currentEntity.accumulated = Int32(item["Accumulated"]!)!
                currentEntity.percent = Double(item["percent"]!)!
                currentEntity.urlImageAmbassador = item["url_image_ambassador"]
                currentEntity.people = Int32(item["people"]!)!
                currentEntity.nameAbassador = item["name_ambassador"]
                
                let moc =  Storage.shared.context
                
                do {
                    try moc.save()
                    return (currentEntity,false)
                } catch {
                    
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }

            }
        }catch{
            fatalError("Failed to fetch benefits: \(error)")
        }
    }
}
