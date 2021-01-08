//
//  File.swift
//  
//
//  Created by Илья Князьков on 05.01.2021.
//

import UIKit

protocol Borderable {

    var top: NSLayoutAnchor<NSLayoutYAxisAnchor> { get }
    var left: NSLayoutAnchor<NSLayoutXAxisAnchor> { get }
    var right: NSLayoutAnchor<NSLayoutXAxisAnchor> { get }
    var bottom: NSLayoutAnchor<NSLayoutYAxisAnchor> { get }

}
