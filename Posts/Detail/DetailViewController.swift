//
//  SecondViewController.swift
//  Posts
//
//  Created by Employee1 on 5/26/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var webSiteLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var catchPhraselabel: UILabel!
    @IBOutlet weak var bsLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    var coordinator: DetailFlow?
    var viewModel: DetailViewModel?
    var userId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
    }

    func getUser() {
        if let userId = userId {
            viewModel?.getUser(by: userId, completion: { (user, error) in
                DispatchQueue.main.async {
                    guard error == nil else {
                        self.showErrorAlert(title: "Error", errorMessage: error!)
                        return
                    }
                    self.fillFields(user: user!)
                }
            })
        }
    }
    
    func fillFields(user: UserModel) {
        nameLabel.text = "Name: " + (user.name ?? "")
        usernameLabel.text = "Username: " + (user.username ?? "")
        emailLabel.text = "Email: " + (user.email ?? "")
        addressLabel.text = "Address"
        streetLabel.text = "Street: " + (user.address?.street ?? "")
        suiteLabel.text = "Suite: " + (user.address?.suite ?? "")
        cityLabel.text = "City: " + (user.address?.city ?? "")
        zipcodeLabel.text = "Zipcode: " + (user.address?.zipcode ?? "")
        phoneLabel.text = "Phone: " + (user.phone ?? "")
        webSiteLabel.text = "Website: " + (user.website ?? "")
        companyLabel.text = "Company"
        companyNameLabel.text = "Name: " + (user.company?.name ?? "")
        catchPhraselabel.text = "Catch Phrase: " + (user.company?.catchPhrase ?? "")
        bsLabel.text = "Bs: " + (user.company?.bs ?? "")
    }
}
