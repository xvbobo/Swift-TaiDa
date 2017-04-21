//
//  Dog+CoreDataProperties.swift
//  
//
//  Created by 许菠菠 on 2017/4/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Dog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dog> {
        return NSFetchRequest<Dog>(entityName: "Dog");
    }

    @NSManaged public var age: String?

}
