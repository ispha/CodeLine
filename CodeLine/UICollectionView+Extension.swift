//
//  UICollectionView+Extension.swift
//  Belo
//
//  Created by Muhammad Khan on 07/12/2020.
//  Copyright © 2020 belo. All rights reserved.
//

import UIKit

extension UICollectionView {
    /// Generically deque cell for reusability
    func dequeueReusableCell<Cell: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as? Cell else {
            fatalError("Fatal error for reuseable cell at : \(indexPath)")
        }
        return cell
    }
    
    func register<Cell: UICollectionViewCell>(_: Cell.Type) {
        register(UINib(nibName: Cell.identifier, bundle: nil), forCellWithReuseIdentifier: Cell.identifier)
    }
}
