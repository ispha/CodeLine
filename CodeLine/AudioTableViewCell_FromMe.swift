//
//  AudioTableViewCell.swift
//  CodeLine
//
//  Created by ispha on 5/27/21.
//

import UIKit

class AudioTableViewCell_FromMe: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    open class func identifier() -> String {
              return String(describing:   AudioTableViewCell_FromMe.self)
    }
}
