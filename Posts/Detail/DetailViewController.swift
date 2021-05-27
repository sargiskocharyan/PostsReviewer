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
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var webSiteLabel: UILabel!
    var coordinator: DetailFlow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "asas"
        usernameLabel.text = "asas"
        emailLabel.text = "asas"
        phoneLabel.text = "asas"
        webSiteLabel.text = "asas"
        view.backgroundColor = .yellow
    }

}
