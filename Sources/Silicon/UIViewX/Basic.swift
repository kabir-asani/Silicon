//
//  Basic.swift
//  
//
//  Created by Kabir Asani on 03/08/24.
//

import UIKit

public extension UIView {
	/// Enables Auto Layout by setting `translatesAutoresizingMaskIntoConstraints = false` on `self`.
	func enableAutoLayout() {
		self.translatesAutoresizingMaskIntoConstraints = false
	}
	
	/// Enables Auto Layout and activates the `constraint` passed in as the argument.
	/// - Parameter constraint: The constraint that you want to activate.
	func activateConstraint(_ constraint: NSLayoutConstraint) {
		enableAutoLayout()
		
		constraint.isActive = true
	}
	
	/// Enables Auto Layout and activates all constraints passed in via the `constraints` argument.
	/// - Parameter constraints: The list of constraints that you want to activate.
	func activateAllConstraints(_ constraints: [NSLayoutConstraint]) {
		enableAutoLayout()
		
		NSLayoutConstraint.activate(constraints)
	}
	
	/// Sets `isHidden` property of the current view to `false`
	func show() {
		isHidden = false
	}
	
	/// Sets `isHidden` property of the current view to `true`
	func hide() {
		isHidden = true
	}
	
	/// Adds current view as the subview of the passed `view` argument.
	/// - Parameter view: The parent view want to which you want to add current view as subview
	func addAsSubview(of view: UIView) {
		view.addSubview(self)
	}
}
