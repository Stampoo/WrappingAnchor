//
//  File.swift
//  
//
//  Created by Илья Князьков on 09.01.2021.
//

import UIKit

open class Positionable: PositionableProtocol {

    public typealias PositionableItem = UIView

    // MARK: - Private methods

    private weak var view: UIView?
    public var location: Positionable { self }
    private let isToSafeArea: Bool
    private var borderableView: Borderable? {
        isToSafeArea ? view?.safeAreaLayoutGuide : view
    }

    // MARK: - Initializers

    public init(view: UIView, isToSafeArea: Bool) {
        self.view = view
        self.isToSafeArea = isToSafeArea
        view.translatesAutoresizingMaskIntoConstraints = false
    }

}

