//
//  File.swift
//  
//
//  Created by Илья Князьков on 09.01.2021.
//

import UIKit

open class Positionable: PositionableProtocol {

    public typealias PositionableItem = UIView

    // MARK: - Private properties

    private var view: UIView
    public var location: Positionable { self }
    private let isToSafeArea: Bool

    // MARK: - Initializers

    public init(view: UIView, isToSafeArea: Bool) {
        self.view = view
        self.isToSafeArea = isToSafeArea
        view.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - Public properties

    @discardableResult
    public func top(to: Borderable,
             const: CGFloat = 0,
             dir: yDir = .top,
             prior: Priority = .default,
             equal: PositionEquality = .equal) -> Positionable {
        let anchor = equal.anchorY(anchor: view.top, toAnchor: dir.getDir(to: to), const: const)
        setPriorityAndActivate(anchor, priority: prior)
        return self
    }

    @discardableResult
    public func bottom(to: Borderable,
             const: CGFloat = 0,
             dir: yDir = .bottom,
             prior: Priority = .default,
             equal: PositionEquality = .equal) -> Positionable {
        let anchor = equal.anchorY(anchor: view.bottom, toAnchor: dir.getDir(to: to), const: -const)
        setPriorityAndActivate(anchor, priority: prior)
        return self
    }

    @discardableResult
    public func left(to: Borderable,
             const: CGFloat = 0,
             dir: xDir = .left,
             prior: Priority = .default,
             equal: PositionEquality = .equal) -> Positionable {
        let anchor = equal.anchorX(anchor: view.left, toAnchor: dir.getDir(to: to), const: const)
        setPriorityAndActivate(anchor, priority: prior)
        return self
    }

    @discardableResult
    public func right(to: Borderable,
             const: CGFloat = 0,
             dir: xDir = .right,
             prior: Priority = .default,
             equal: PositionEquality = .equal) -> Positionable {
        let anchor = equal.anchorX(anchor: view.right, toAnchor: dir.getDir(to: to), const: -const)
        setPriorityAndActivate(anchor, priority: prior)
        return self
    }

    @discardableResult
    public func pin(to view: Borderable, const: CGFloat = 0, equal: PositionEquality = .equal) -> Positionable {
        top(to: view, const: const, equal: equal)
            .left(to: view, const: const, equal: equal)
            .right(to: view, const: const, equal: equal)
            .bottom(to: view, const: const, equal: equal)
        return self
    }

    @discardableResult
    public func height(to view: UIView? = nil,
                const: CGFloat = 0,
                priority: Priority = .default,
                equal: PositionEquality = .equal) -> Positionable {
        guard let view = view else {
            let anchor = equal.sideAnchor(anchor: self.view.heightAnchor, const: const)
            setPriorityAndActivate(anchor, priority: priority)
            return self
        }
        let anchor = equal.sideAnchor(anchor: self.view.heightAnchor, toAnchor: view.heightAnchor, const: const)
        setPriorityAndActivate(anchor, priority: priority)
        return self
    }

    @discardableResult
    public func width(to view: UIView? = nil,
                const: CGFloat = 0,
                priority: Priority = .default,
                equal: PositionEquality = .equal) -> Positionable {
        guard let view = view else {
            let anchor = equal.sideAnchor(anchor: self.view.widthAnchor, const: const)
            setPriorityAndActivate(anchor, priority: priority)
            return self
        }
        let anchor = equal.sideAnchor(anchor: self.view.widthAnchor, toAnchor: view.widthAnchor, const: const)
        setPriorityAndActivate(anchor, priority: priority)
        return self
    }

    public func size(to view: UIView? = nil, size: CGSize = .zero) -> Positionable {
        height(to: view, const: size.height)
        width(to: view, const: size.width)
        return self
    }


    // MARK: - Private methods

    private func setPriorityAndActivate(_ constraint: NSLayoutConstraint, priority: Priority) {
        constraint.priority = UILayoutPriority(rawValue: priority.priority.rawValue)
        constraint.isActive = true
    }

}

