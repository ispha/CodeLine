//
//  UITableView+Extension.swift
//  Belo
//
//  Created by Muhammad Khan on 07/12/2020.
//  Copyright © 2020 belo. All rights reserved.
//

import UIKit

extension UITableView {
    /// Generically deque cell for reusability
    func dequeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell else {
            fatalError("Fatal error for reuseable cell at : \(indexPath)")
        }
        return cell
    }
    
    func register<Cell: UITableViewCell>(_: Cell.Type) {
        register(UINib(nibName: Cell.identifier, bundle: nil), forCellReuseIdentifier: Cell.identifier)
    }
}
