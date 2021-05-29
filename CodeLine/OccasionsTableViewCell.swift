//
//  OccasionsTableViewCell.swift
//  CodeLine
//
//  Created by ispha on 5/29/21.
//

import UIKit

class OccasionsTableViewCell: UITableViewCell {

    // MARK- outlets
    @IBOutlet weak var imgv: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var btn: DesignableButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    open class func identifier() -> String {
              return String(describing:   OccasionsTableViewCell.self)
    }
}
