//
//  ViewController.swift
//  DBDemo
//
//  Created by Vu Thanh Nam on 19/05/2022.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    
    @IBOutlet weak var txtFullname: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBAction func Check(_ sender: UIButton) {
        
         let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
         let context:NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        var request = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
        
      
        do {
            let results:NSArray = try context.fetch(request) as NSArray
            for result in results{
                guard let customer = result as? Customer else{
                    return
                }
                print("username:\(customer.username!)")
                print("identifier\(customer.identifier)")
                print("fullname\(customer.fullname!)")
                print("password\(customer.password)")
                print("email\(customer.email!)")
                print("address\(customer.address!)")
                print("phone\(customer.phone!)")
                
                print("--------------------")
            }
            
            
        } catch  {
            print("error")
        }
        
        
    }
    @IBAction func Save(_ sender: UIButton) {
       
        let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context:NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Customer", in: context)
        let newCustomer = Customer(entity: entity!, insertInto: context)
        
        newCustomer.fullname = txtFullname.text
        newCustomer.username = txtUsername.text
        newCustomer.password = txtPassword.text
        newCustomer.phone = txtPhone.text
        newCustomer.email = txtEmail.text
        newCustomer.address = txtAddress.text
        
        do {
            try context.save()
        } catch  {
            print("save error")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }


}

