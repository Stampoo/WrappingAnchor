//
//  File.swift
//  
//
//  Created by Илья Князьков on 04.01.2021.
//

import UIKit

public protocol PositionableProtocol {

    associatedtype PositionableItem where PositionableItem == UIView

    var location: Positionable { get }

}
