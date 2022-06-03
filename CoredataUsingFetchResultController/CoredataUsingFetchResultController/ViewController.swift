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
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func loadData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let items = try context.fetch(UserEntity.fetchRequest())
            print("---- items", items.last?.array)
            DispatchQueue.main.async {
//                self.tableView.reloadData()
                guard let imageData = items.last?.avatar else {
                    return
                }
                self.imageView.image = UIImage(data: imageData)
            }
        } catch {
            print("Couldn't Fetch Data")
        }
    }
    
    func createNew() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let user = UserEntity(context: context)
        user.age = 19
        user.name = "dang duy cuong"
        user.email = "cuongdd@vmodev.com"
        if let array = contentTextField.text?.split(separator: ",") {
            user.array = array.map { String($0) }
        }
        print("----", user.array)
        user.avatar = UIImage(named: "voxngoctraan")?.pngData()
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    @IBAction func tapToLoadData(_ sender: Any) {
        loadData()
    }
    
    @IBAction func save(_ sender: Any) {
        createNew()
    }
    
}

