//
//  DashboardViewController.swift
//  UserCoreData
//
//  Created by Md Omar faruq on 6/5/23.
//

import UIKit
import CoreData

class DashboardViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userGet()
        
        // Do any additional setup after loading the view.
    }
    
    func userGet() {
    
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
        fetchRequest.returnsObjectsAsFaults = false
       do{
           let results = try context.fetch(fetchRequest)

           for result in results as! [NSManagedObject]{
               if let name = result.value(forKey: "firstName") as? String{
                   self.userNameLabel.text = "Name: \(name)"

              }
               if let userName = result.value(forKey: "lastName") as? String{
                   self.phoneNumberLabel.text = "UserName: \(userName)"

              }
             if let phoneNumber = result.value(forKey: "email") as? String{
                 self.userEmailLabel.text = "Phone: \(phoneNumber)"
              }

            }
           
           
           
       }
        catch{
           print("error")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(), style: .plain, target: self, action: nil)
    }
    @IBAction func goBackAction(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "email")
        guard let VC = self.storyboard?.instantiateViewController(withIdentifier: "UserListViewController") as? UserListViewController else { return }
        navigationController?.pushViewController(VC, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
