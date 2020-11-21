//
//  File.swift
//  
//
//  Created by Илья Князьков on 17/11/2020.
//

import UIKit

public extension UIView {
    
    // MARK: - Public methods

    func set(constraints: Constraints...) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = constraints.flatMap { $0.getConstraints(for: self) }
        constraints.forEach { $0.isActive = true }
        return constraints
    }

}
