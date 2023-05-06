//
//  LoginViewController.swift
//  UserCoreData
//
//  Created by Md Omar faruq on 5/5/23.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    @IBOutlet weak var userEmailUITextField: UITextField!
    @IBOutlet weak var userPasswordUITextField: UITextField!

    var mailArray = [String]()
    var passwordArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signButtonAction(_ sender: UIButton) {
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject]{
                if let mail = result.value(forKey: "lastName") as? String{
                    self.mailArray.append(mail)
                }
                if let password = result.value(forKey: "password") as? String{
                    self.passwordArray.append(password)
                }
                
            }
        }
        catch{
            print("error")
        }
        
        if (mailArray.contains(userEmailUITextField.text!)){
            let mailIndex = mailArray.firstIndex(where: {$0 == userEmailUITextField.text})
            
            if passwordArray[mailIndex!] == userPasswordUITextField.text{
                guard let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "UserListViewController") as? UserListViewController else { return }
                navigationController?.pushViewController(registerVC, animated: true)
            }
        }
        else{
            // create the alert
            let alert = UIAlertController(title: "Not Found", message: "No account found for this e-mail address", preferredStyle: .alert)
            // add an action (button)
            //alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                }
            alert.addAction(okAction)
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        guard let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else { return }
        navigationController?.pushViewController(registerVC, animated: true)
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
