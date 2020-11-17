//
//  File.swift
//  
//
//  Created by Илья Князьков on 17/11/2020.
//

import UIKit

extension UIView {
    
    // MARK: - Public methods

    func setConstraints(constraints: Constraints...) {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.forEach { NSLayoutConstraint.activate($0.getConstraints(for: self)) }
    }

}
