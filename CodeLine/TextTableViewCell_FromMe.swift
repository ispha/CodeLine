//
//  TextTableViewCell_In.swift
//  CodeLine
//
//  Created by ispha on 5/27/21.
//

import UIKit

class TextTableViewCell_FromMe: UITableViewCell {
    // MARK- outlets
    @IBOutlet weak var lblText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    open class func identifier() -> String {
              return String(describing:   TextTableViewCell_FromMe.self)
    }
}
