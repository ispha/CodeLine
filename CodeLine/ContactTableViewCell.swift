//
//  ConversationTableViewCell.swift
//  CodeLine
//
//  Created by ispha on 5/30/21.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    // MARK- outlets
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var imgvConstraintHeight: NSLayoutConstraint!
    @IBOutlet weak var imgv_person: UIImageView!
    
     override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    open class func identifier() -> String {
              return String(describing:   ContactTableViewCell.self)
    }
    
    
}
