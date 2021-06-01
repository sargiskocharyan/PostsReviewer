//
//  SecondViewController.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import UIKit

class PostDetailViewController: UIViewController {
    
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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var userInfoLabel: UILabel!
    
    var coordinator: PostDetailFlow?
    var viewModel: PostDetailViewModel?
    var userId: Int?
    var body: String?
    var postTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        getUser()
    }
    
    func configureViews() {
        bodyTextView.layer.cornerRadius = 8
        bodyTextView.backgroundColor = UIColor.appLightGray
        infoView.layer.cornerRadius = 8
        infoView.backgroundColor = UIColor.appLightGray
        
    }

    func getUser() {
        activityIndicator.startAnimating()
        if let userId = userId {
            viewModel?.getUser(by: userId, completion: { (user, error) in
                DispatchQueue.main.async { [self] in
                    guard error == nil else {
                        self.showErrorAlert(title: "error".localized(), errorMessage: error!.localized())
                        return
                    }
                    activityIndicator.stopAnimating()
                    self.fillFields(user: user!)
                }
            })
        }
    }
    
    func generateAtributedString(str: String, info: String) -> NSMutableAttributedString {
        let name = str.localized()
        let firstMultipleAttributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12) as Any,  NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        
        let first = NSAttributedString(string: name, attributes: firstMultipleAttributes)
        let secondMultipleAttributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14) as Any,  NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        let second = NSAttributedString(string: (info), attributes: secondMultipleAttributes)
        let concate = NSMutableAttributedString(attributedString: first)
        concate.append(second)
        return concate
    }
    
    func fillFields(user: UserModel) {
        nameLabel.attributedText = generateAtributedString(str: "name", info: user.name ?? "")
        usernameLabel.attributedText = generateAtributedString(str: "username", info: user.username ?? "")
        emailLabel.attributedText = generateAtributedString(str: "email", info: user.email ?? "")
        addressLabel.attributedText = generateAtributedString(str: "address", info: "")
        streetLabel.attributedText = generateAtributedString(str: "street", info: user.address?.street ?? "")
        suiteLabel.attributedText = generateAtributedString(str: "suite", info: user.address?.suite ?? "")
        cityLabel.attributedText = generateAtributedString(str: "city", info: user.address?.city ?? "")
        zipcodeLabel.attributedText = generateAtributedString(str: "zipcode", info: user.address?.zipcode ?? "")
        phoneLabel.attributedText = generateAtributedString(str: "phone_number", info: user.phone ?? "")
        webSiteLabel.attributedText = generateAtributedString(str: "website", info: user.website ?? "")
        companyLabel.attributedText = generateAtributedString(str: "company", info: "")
        companyNameLabel.attributedText = generateAtributedString(str: "name", info: user.name ?? "")
        catchPhraselabel.attributedText = generateAtributedString(str: "catch_phrase", info: user.company?.catchPhrase ?? "")
        bsLabel.attributedText = generateAtributedString(str: "bs", info: user.company?.bs ?? "")
        titleLabel.text = postTitle
        bodyTextView.text = body
        userInfoLabel.text = "user_info".localized()
    }
}
