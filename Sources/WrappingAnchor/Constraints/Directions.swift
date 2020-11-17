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

}
