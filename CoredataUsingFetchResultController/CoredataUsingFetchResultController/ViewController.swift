//
//  ViewController.swift
//  CoredataUsingFetchResultController
//
//  Created by cuongdd on 02/06/2022.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var contentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func createNew() {
        let user = UserEntity(context: AppDelegate.context)
        user.age = 19
        user.name = "dang duy cuong"
        user.email = "cuongdd@vmodev.com"
        
        AppDelegate.context.saveContext()
    }

    @IBAction func save(_ sender: Any) {
        createNew()
    }
    
}

