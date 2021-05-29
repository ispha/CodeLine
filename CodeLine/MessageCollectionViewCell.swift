//
//  MessageCollectionViewCell.swift
//  CodeLine
//
//  Created by ispha on 5/26/21.
//

import UIKit

class MessageCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    open class func identifier() -> String {
              return String(describing:   MessageCollectionViewCell.self)
    }
}
