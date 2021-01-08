//
//  File.swift
//  
//
//  Created by Илья Князьков on 09.01.2021.
//

import UIKit

extension UILayoutGuide: Borderable {

    var top: NSLayoutAnchor<NSLayoutYAxisAnchor> {
        topAnchor
    }
    var left: NSLayoutAnchor<NSLayoutXAxisAnchor> {
        leftAnchor
    }
    var right: NSLayoutAnchor<NSLayoutXAxisAnchor> {
        rightAnchor
    }
    var bottom: NSLayoutAnchor<NSLayoutYAxisAnchor> {
        bottomAnchor
    }

}
