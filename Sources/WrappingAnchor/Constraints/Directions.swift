//
//  File.swift
//  
//
//  Created by Илья Князьков on 17/11/2020.
//

import UIKit

public enum yDir {

    case top
    case bottom

    func getDir(to view: UIView) -> NSLayoutYAxisAnchor {
        switch self {
        case .top:
            return view.topAnchor
        case .bottom:
            return view.bottomAnchor
        }
    }

    func getDir(to view: Borderable) -> NSLayoutAnchor<NSLayoutYAxisAnchor> {
        switch self {
        case .top:
            return view.top
        case .bottom:
            return view.bottom
        }
    }

}

public enum xDir {

    case left
    case right

    func getDir(to view: UIView) -> NSLayoutXAxisAnchor {
        switch self {
        case .left:
            return view.leftAnchor
        case .right:
            return view.rightAnchor
        }
    }

    func getDir(to view: Borderable) -> NSLayoutAnchor<NSLayoutXAxisAnchor> {
        switch self {
        case .left:
            return view.left
        case .right:
            return view.right
        }
    }

}
