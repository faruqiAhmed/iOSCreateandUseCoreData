//
//  LoginedsuccessfullViewController.swift
//  UserCoreData
//
//  Created by Md Omar faruq on 6/5/23.
//

import UIKit

class LoginedsuccessfullViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dashboardButtonAction(_ sender: Any) {
        guard let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController else { return }
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
