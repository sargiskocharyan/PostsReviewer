//
//  PostsTableViewCell.swift
//  Posts
//
//  Created by Employee1 on 5/26/21.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(titleText: String, bodyText: String) {
        titleLabel.text = titleText
        bodyLabel.text = bodyText
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
