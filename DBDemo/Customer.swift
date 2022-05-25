//
//  Customer.swift
//  DBDemo
//
//  Created by Vu Thanh Nam on 19/05/2022.
//

import CoreData

@objc(Customer)
class Customer :NSManagedObject {
    @NSManaged var identifier:NSNumber!
    @NSManaged var fullname:String!
    @NSManaged var username:String!
    @NSManaged var password:String!
    @NSManaged var phone:String!
    @NSManaged var email:String!
    @NSManaged var address:String!
}
