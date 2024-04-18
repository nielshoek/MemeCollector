//
//  MemeEntity+CoreDataClass.swift
//  MemeCollector
//
//  Created by Niels Hoek on 26/02/2021.
//
//

import Foundation
import CoreData

@objc(MemeEntity)
public class MemeEntity: NSManagedObject {
    var displayImageData: Data?
    
    var imgData: Data {
        get {
            imgData_
        }
        set {
            imgData_ = newValue
            displayImageData = newValue
        }
    }
}

extension MemeEntity: Identifiable {

    static func fetchRequest(predicate: NSPredicate = NSPredicate.all) -> NSFetchRequest<MemeEntity> {
        let request = NSFetchRequest<MemeEntity>(entityName: "MemeEntity")
        request.predicate = predicate
        request.sortDescriptors = []
        
        return request
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String
    @NSManaged public var imgData_: Data
    @NSManaged public var author: String
    @NSManaged public var redditUrl: String
    @NSManaged public var country: String?
    @NSManaged public var category: String?
    @NSManaged public var date: Date
    
    static var categories = ["Nederlands", "Engels", "Dank"]
}
