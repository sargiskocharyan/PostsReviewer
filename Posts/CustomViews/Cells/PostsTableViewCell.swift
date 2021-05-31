//
//  PostsTableViewCell.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/26/21.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor = UIColor.darkGray
        bodyLabel.textColor = UIColor.lightGray
    }

    func configureCell(titleText: String, bodyText: String) {
        titleLabel.text = titleText
        bodyLabel.text = bodyText
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
