//
//  File.swift
//  
//
//  Created by Илья Князьков on 09.01.2021.
//

import UIKit

extension UILayoutGuide: Borderable {

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
