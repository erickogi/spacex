//
//  UIView+AutoLayout.swift
//  CBALoop
//
//  Created by Jarret Hardie on 26/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

typealias Constraint = (_ child: UIView, _ parent: UIView) -> NSLayoutConstraint

func equal<Axis, L>(_ from: KeyPath<UIView, L>, _ to: KeyPath<UIView, L>) -> Constraint  where L: NSLayoutAnchor<Axis> {
    return { view, parent in
        view[keyPath: from].constraint(equalTo: parent[keyPath: to])
    }
}

func equal<Axis, L>(_ to: KeyPath<UIView, L>) -> Constraint  where L: NSLayoutAnchor<Axis> {
    return { view, parent in
        view[keyPath: to].constraint(equalTo: parent[keyPath: to])
    }
}

func equal<L>(_ keyPath: KeyPath<UIView, L>, to constant: CGFloat) -> Constraint  where L: NSLayoutDimension {
    return { view, parent in
        view[keyPath: keyPath].constraint(equalToConstant: constant)
    }
}

extension UIView {
    
    func addAutoLayedOutSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    func addSubview(_ view: UIView, constraints: [NSLayoutConstraint]) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func addSubview(_ other: UIView, constraints: [Constraint]) {
        addSubview(other)
        other.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { c in
            c(other, self)
        })
    }
    
    func insertSubview(_ other: UIView, at index: Int, constraints: [Constraint]) {
        insertSubview(other, at: index)
        other.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { c in
            c(other, self)
        })
    }

}
