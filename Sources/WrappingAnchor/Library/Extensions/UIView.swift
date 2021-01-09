//
//  File.swift
//  
//
//  Created by Илья Князьков on 17/11/2020.
//

import UIKit

extension UIView: PositionConfigurator {

    public var position: Positionable {
        .init(view: self, isToSafeArea: false)
    }

}

public extension UIView {

    // MARK: - Public methods

    @discardableResult
    func set(constraints: Constraints...) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = constraints.flatMap { $0.getConstraints(for: self) }
        constraints.forEach { $0.isActive = true }
        return constraints
    }

}

extension UIView: Borderable {

    public var top: NSLayoutAnchor<NSLayoutYAxisAnchor> {
        topAnchor
    }
    public var left: NSLayoutAnchor<NSLayoutXAxisAnchor> {
        leftAnchor
    }
    public var right: NSLayoutAnchor<NSLayoutXAxisAnchor> {
        rightAnchor
    }
    public var bottom: NSLayoutAnchor<NSLayoutYAxisAnchor> {
        bottomAnchor
    }

}


