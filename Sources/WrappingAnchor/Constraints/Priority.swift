//
//  File.swift
//  
//
//  Created by Илья Князьков on 17/11/2020.
//

import UIKit

public enum Priority {
    case hight
    case medium
    case low
    case custom(prior: Float)
    case `default`
}

extension Priority {
    var priority: UILayoutPriority {
        switch self {
        case .hight:
            return .defaultHigh
        case .medium:
            return .init(rawValue: 500)
        case .low:
            return .defaultLow
        case .custom(let prior):
            return .init(rawValue: prior)
        case .default:
            return .required
        }
    }
}
