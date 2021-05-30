//
//  CallsTableViewCell.swift
//  CodeLine
//
//  Created by ispha on 5/29/21.
//

import UIKit

class CallsTableViewCell: UITableViewCell {

    // MARK- outlets
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var imgv_person: UIImageView!
    @IBOutlet weak var imgv_call: UIImageView!
    @IBOutlet weak var imgv_in_out: UIImageView!
     override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    open class func identifier() -> String {
              return String(describing:   CallsTableViewCell.self)
    }
}
