//
//  Match.swift
//
//
//  Created by Kabir Asani on 03/08/24.
//

import UIKit

public extension UIView {
	/// Matches the vertical center of the current view to the vertical center of the passed `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the current view leftwards and a negative margin pushes it rightwards.
	///
	/// - Parameters:
	///   - view: The view you want to align with. It at has to be a sibling (or ancestor) of the current view.
	///   - offset: The offset by which you want to move your view.
	///   - safeAreaEnabled: A flag indicating whether to match relative to the `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func match(
		toVerticalCenterOf view: UIView,
		withOffset offset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.centerYAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.centerYAnchor : view.centerYAnchor,
			constant: offset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Matches the horizontal center of the current view to the horizontal center of the passed `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the current view downwards and a negative margin pushes it upwards.
	///
	/// - Parameters:
	///   - view: The view you want to align with. It at has to be a sibling (or ancestor) of the current view.
	///   - offset: The offset by which you want to move your view.
	///   - safeAreaEnabled: A flag indicating whether to match relative to the `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func match(
		toHorizontalCenterOf view: UIView,
		withOffset offset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.centerXAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.centerXAnchor : view.centerXAnchor,
			constant: offset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
}
