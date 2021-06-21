//
//  File.swift
//  
//
//  Created by Илья Князьков on 09.01.2021.
//

import UIKit

open class Positionable: PositionableProtocol {

    // MARK: - Nested types

    enum Direction: String, CaseIterable {
        case top
        case left
        case right
        case bottom
        case centerY
        case centerX
        case height
        case width

        func identifire(fromCombine view: UIView) -> String {
            "\(rawValue)\(view.hashValue)"
        }

    }

    public typealias PositionableItem = UIView

    // MARK: - Private properties

    private var view: UIView
    private var viewsWithConstraints = [UIView: [NSLayoutConstraint]]()
    public var location: Positionable { self }
    private let isToSafeArea: Bool

    // MARK: - Initializers

    public init(view: UIView, isToSafeArea: Bool) {
        self.view = view
        self.isToSafeArea = isToSafeArea
        view.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - Public methods

    @discardableResult
    public func top(to: Borderable,
             const: CGFloat = 0,
             dir: yDir = .top,
             prior: Priority = .default,
             equal: PositionEquality = .equal) -> Positionable {
        let anchor = equal.anchorY(anchor: view.top, toAnchor: dir.getDir(to: to), const: const)
        setIdentifireToConstraint(constraintDirection: .top, constraint: anchor)
        setPriorityAndActivate(anchor, priority: prior, direction: .top)
        return self
    }

    @discardableResult
    public func bottom(to: Borderable,
             const: CGFloat = 0,
             dir: yDir = .bottom,
             prior: Priority = .default,
             equal: PositionEquality = .equal) -> Positionable {
        let anchor = equal.anchorY(anchor: view.bottom, toAnchor: dir.getDir(to: to), const: -const)
        setIdentifireToConstraint(constraintDirection: .bottom, constraint: anchor)
        setPriorityAndActivate(anchor, priority: prior, direction: .bottom)
        return self
    }

    @discardableResult
    public func left(to: Borderable,
             const: CGFloat = 0,
             dir: xDir = .left,
             prior: Priority = .default,
             equal: PositionEquality = .equal) -> Positionable {
        let anchor = equal.anchorX(anchor: view.left, toAnchor: dir.getDir(to: to), const: const)
        setIdentifireToConstraint(constraintDirection: .left, constraint: anchor)
        setPriorityAndActivate(anchor, priority: prior, direction: .left)
        return self
    }

    @discardableResult
    public func right(to: Borderable,
             const: CGFloat = 0,
             dir: xDir = .right,
             prior: Priority = .default,
             equal: PositionEquality = .equal) -> Positionable {
        let anchor = equal.anchorX(anchor: view.right, toAnchor: dir.getDir(to: to), const: -const)
        setIdentifireToConstraint(constraintDirection: .right, constraint: anchor)
        setPriorityAndActivate(anchor, priority: prior, direction: .right)
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
            setPriorityAndActivate(anchor, priority: priority, direction: .height)
            return self
        }
        let anchor = equal.sideAnchor(anchor: self.view.heightAnchor, toAnchor: view.heightAnchor, const: const)
        setIdentifireToConstraint(constraintDirection: .height, constraint: anchor)
        setPriorityAndActivate(anchor, priority: priority, direction: .height)
        return self
    }

    @discardableResult
    public func width(to view: UIView? = nil,
                const: CGFloat = 0,
                priority: Priority = .default,
                equal: PositionEquality = .equal) -> Positionable {
        guard let view = view else {
            let anchor = equal.sideAnchor(anchor: self.view.widthAnchor, const: const)
            setPriorityAndActivate(anchor, priority: priority, direction: .width)
            return self
        }
        let anchor = equal.sideAnchor(anchor: self.view.widthAnchor, toAnchor: view.widthAnchor, const: const)
        setIdentifireToConstraint(constraintDirection: .width, constraint: anchor)
        setPriorityAndActivate(anchor, priority: priority, direction: .width)
        return self
    }

    @discardableResult
    public func size(to view: UIView? = nil, size: CGSize = .zero) -> Positionable {
        height(to: view, const: size.height)
        width(to: view, const: size.width)
        return self
    }

    @discardableResult
    public func centerX(to view: UIView? = nil,
                     const: CGFloat = 0,
                     priority: Priority = .default,
                     equal: PositionEquality = .equal) -> Positionable {
        let directViewOrSuperView = view ?? self.view.superview
        guard let view = directViewOrSuperView else {
            return self
        }
        let anchor = equal.anchorX(
            anchor: self.view.centerXAnchor,
            toAnchor: view.centerXAnchor,
            const: const
        )
        setIdentifireToConstraint(constraintDirection: .centerX, constraint: anchor)
        setPriorityAndActivate(anchor, priority: priority, direction: .centerX)
        return self
    }

    @discardableResult
    public func centerY(to view: UIView? = nil,
                     const: CGFloat = 0,
                     priority: Priority = .default,
                     equal: PositionEquality = .equal) -> Positionable {
        let directViewOrSuperView = view ?? self.view.superview
        guard let view = directViewOrSuperView else {
            return self
        }
        let anchor = equal.anchorY(
            anchor: self.view.centerYAnchor,
            toAnchor: view.centerYAnchor,
            const: const
        )
        setIdentifireToConstraint(constraintDirection: .centerY, constraint: anchor)
        setPriorityAndActivate(anchor, priority: priority, direction: .centerY)
        return self
    }



    // MARK: - Private methods

    private func setPriorityAndActivate(_ constraint: NSLayoutConstraint,
                                        priority: Priority,
                                        direction: Direction) {
        disableOldConstraintIfNeeded(direction: direction)
        addConstraintInfo(onView: view, constraint: constraint)
        constraint.priority = UILayoutPriority(rawValue: priority.priority.rawValue)
        constraint.isActive = true
    }

    private func addConstraintInfo(onView view: UIView, constraint: NSLayoutConstraint) {
        if viewsWithConstraints[view] != nil {
            viewsWithConstraints[view]?.append(constraint)
        } else {
            viewsWithConstraints[view] = [constraint]
        }
    }

    private func disableOldConstraintIfNeeded(direction: Direction) {
        view.constraints.first { [weak view] constrintsInView in
            guard let view = view else {
                return false
            }
            return constrintsInView.identifier == direction.identifire(fromCombine: view)
        }?.isActive = false
    }

    private func setIdentifireToConstraint(constraintDirection direction: Direction,
                                           constraint: NSLayoutConstraint) {
        constraint.identifier = direction.identifire(fromCombine: view)
    }

}

