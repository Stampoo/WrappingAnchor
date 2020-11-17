//
//  File.swift
//  
//
//  Created by Илья Князьков on 17/11/2020.
//

import UIKit

enum Constraints {
    
    case fill(view: UIView)
    case pinToCenter(view: UIView)
    case setSize(size: CGSize, priority: Priority = .default)
    case setXto(view: UIView)
    case setYto(view: UIView)
    case bottom(view: UIView, const: CGFloat = .zero,
        dir: yDir = .bottom, priority: Priority = .default)
    case top(view: UIView, const: CGFloat = .zero,
        dir: yDir = .top, priority: Priority = .default)
    case left(view: UIView, const: CGFloat = .zero,
        dir: xDir = .left, priority: Priority = .default)
    case right(view: UIView, const: CGFloat = .zero,
        dir: xDir = .right, priority: Priority = .default)

}

// MARK: - Extensions

extension Constraints {

    // MARK: - Public methods

    func getConstraints(for view: UIView) -> [NSLayoutConstraint] {
        switch self {
        case .fill(let equalView):
            return equalBorder(for: view, to: equalView)
        case .pinToCenter(let equalView):
            return equalCenter(for: view, to: equalView)
        case let .setSize(size, priority):
            let setSizeVar = setSize(for: view, to: size)
            setSizeVar.forEach { $0.priority = priority.priority }
            return setSizeVar
        case .setXto(let equalView):
            return equalX(for: view, to: equalView)
        case .setYto(let equalView):
            return equalY(for: view, to: equalView)
        case let .bottom(equalView, const, dir, priority):
            let setVar = setBottom(for: view, to: equalView, constant: const, direction: dir)
            setVar.forEach { $0.priority = priority.priority }
            return setVar
        case let .top(equalView, const, dir, priority):
            let setVar = setTop(for: view, to: equalView, constant: const, direction: dir)
            setVar.forEach { $0.priority = priority.priority }
            return setVar
        case let .left(equalView, const, dir, priority):
           let setVar = setLeft(for: view, to: equalView, constant: const, direction: dir)
            setVar.forEach { $0.priority = priority.priority }
            return setVar
        case let .right(equalView, const, dir, priority):
            let setVar = setRight(for: view, to: equalView, constant: const, direction: dir)
            setVar.forEach { $0.priority = priority.priority }
            return setVar
        }
    }

    // MARK: - Private methods

    private func equalBorder(for mainView: UIView,
                             to view: UIView) -> [NSLayoutConstraint] {
        [
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ]
    }

    private func equalCenter(for mainView: UIView,
                             to view: UIView) -> [NSLayoutConstraint] {
        [
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
    }

    private func equalX(for mainView: UIView,
                        to view: UIView) -> [NSLayoutConstraint] {
        [
            mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
    }

    private func equalY(for mainView: UIView,
                        to view: UIView) -> [NSLayoutConstraint] {
        [
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
    }

    private func setSize(for mainView: UIView,
                         to size: CGSize) -> [NSLayoutConstraint] {
        if size.width <= .zero, size.height <= .zero {
            return []
        }
        if size.width <= .zero {
            return [mainView.heightAnchor.constraint(equalToConstant: size.height)]
        }
        if size.height <= .zero {
            return [mainView.widthAnchor.constraint(equalToConstant: size.width)]
        } else {
            return [
                mainView.heightAnchor.constraint(equalToConstant: size.height),
                mainView.widthAnchor.constraint(equalToConstant: size.width)
            ]
        }
    }

    private func setBottom(for mainView: UIView,
                           to view: UIView,
                           constant: CGFloat,
                           direction: yDir = .bottom) -> [NSLayoutConstraint] {
        [
            mainView.bottomAnchor.constraint(equalTo: direction.getDir(to: view), constant: constant)
        ]
    }

    private func setLeft(for mainView: UIView,
                         to view: UIView,
                         constant: CGFloat,
                         direction: xDir = .left) -> [NSLayoutConstraint] {
        [
            mainView.leftAnchor.constraint(equalTo: direction.getDir(to: view), constant: constant)
        ]
    }

    private func setRight(for mainView: UIView,
                          to view: UIView,
                          constant: CGFloat,
                          direction: xDir = .right) -> [NSLayoutConstraint] {
        [
            mainView.rightAnchor.constraint(equalTo: direction.getDir(to: view), constant: constant)
        ]
    }

    private func setTop(for mainView: UIView,
                        to view: UIView,
                        constant: CGFloat, direction: yDir = .top) -> [NSLayoutConstraint] {
        [
            mainView.topAnchor.constraint(equalTo: direction.getDir(to: view), constant: constant)
        ]
    }

}
