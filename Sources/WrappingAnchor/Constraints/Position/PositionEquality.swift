//
//  File.swift
//  
//
//  Created by Илья Князьков on 09.01.2021.
//

import UIKit

public enum PositionEquality {
    case equal
    case lessOrEqual
    case moreOrEqual
}

extension PositionEquality {

    func anchorX(anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                toAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                const: CGFloat) -> NSLayoutConstraint {
        switch self {
        case .equal:
            return anchor.constraint(equalTo: toAnchor, constant: const)
        case .lessOrEqual:
            return anchor.constraint(lessThanOrEqualTo: toAnchor, constant: const)
        case .moreOrEqual:
            return anchor.constraint(greaterThanOrEqualTo: toAnchor, constant: const)
        }
    }

    func anchorY(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                toAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                const: CGFloat) -> NSLayoutConstraint {
        switch self {
        case .equal:
            return anchor.constraint(equalTo: toAnchor, constant: const)
        case .lessOrEqual:
            return anchor.constraint(lessThanOrEqualTo: toAnchor, constant: const)
        case .moreOrEqual:
            return anchor.constraint(greaterThanOrEqualTo: toAnchor, constant: const)
        }
    }

    func sideAnchor(anchor: NSLayoutDimension, toAnchor: NSLayoutDimension? = nil, const: CGFloat) -> NSLayoutConstraint {
        guard let toAnchor = toAnchor else {
            return anchor.constraint(equalToConstant: const)
        }
        switch self {
        case .equal:
            return anchor.constraint(equalTo: toAnchor, constant: const)
        case .lessOrEqual:
            return anchor.constraint(lessThanOrEqualTo: toAnchor, constant: const)
        case .moreOrEqual:
            return anchor.constraint(greaterThanOrEqualTo: toAnchor, constant: const)
        }
    }

}
