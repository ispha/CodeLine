//
//  MessageTableViewCell.swift
//  CodeLine
//
//  Created by ispha on 5/26/21.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    // MARK- outlets
    @IBOutlet weak var view_number: UIView!
    @IBOutlet weak var imgv_marks: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    open class func identifier() -> String {
              return String(describing:   MessageTableViewCell.self)
    }
}
