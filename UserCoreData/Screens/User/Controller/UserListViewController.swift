///
//  UserListViewController.swift
//  UserCoreData
//
//  Created by Md Omar faruq on 5/5/23.
//

import UIKit

class UserListViewController: UIViewController {

    
    @IBOutlet weak var userTableView: UITableView!
    private var users: [UserEntity] = []
    private let manager = DatabaseManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        users = manager.fetchUsers()
        userTableView.reloadData()
    }
    
    @IBAction func addUserButtonTapped(_ sender: UIButton) {
        guard let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController else { return }
        navigationController?.pushViewController(registerVC, animated: true)
    }

}

extension UserListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        let user = users[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.text = (user.firstName ?? "") + " " + (user.lastName ?? "") // title
        content.secondaryText = "Email: \(user.email ?? "")" // subTitle

        let imageURL = URL.documentsDirectory.appending(components: user.imageName ?? "").appendingPathExtension("png")
        content.image = UIImage(contentsOfFile: imageURL.path)

        var imagePro = content.imageProperties
        imagePro.maximumSize = CGSize(width: 80, height: 80)
        content.imageProperties = imagePro

        cell.contentConfiguration = content // MIMP
        return cell
    }
}
