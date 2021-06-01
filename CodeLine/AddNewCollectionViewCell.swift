//
//  AddNewCollectionViewCell.swift
//  CodeLine
//
//  Created by ispha on 5/31/21.
//

import UIKit

class AddNewCollectionViewCell: UICollectionViewCell {

    // MARK- outlets
    @IBOutlet weak var imgv: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    open class func identifier() -> String {
              return String(describing:   AddNewCollectionViewCell.self)
    }
}
