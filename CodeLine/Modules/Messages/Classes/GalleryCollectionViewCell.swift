//
//  GalleryCollectionViewCell.swift
//  CodeLine
//
//  Created by ispha on 5/28/21.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    // MARK- outlets
    @IBOutlet weak var imgv: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    open class func identifier() -> String {
              return String(describing:   GalleryCollectionViewCell.self)
    }
}
