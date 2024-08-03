//
//  Align.swift
//
//
//  Created by Kabir Asani on 03/08/24.
//

import UIKit

public extension UIView {
	/// Aligns the current view to the vertical center of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: For aligning rightwards, use a postive value for `inset` and for aligning leftwards, use a negative value.
	///
	/// - Parameters:
	///   - view: The view you want to align with. It has to be an ancestor of current view.
	///   - offset: The offset by which you want to align leftware or rightward. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to align relative to the `safeAreaLayoutGuide` or not.
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func align(
		toVerticalCenterOf view: UIView,
		withOffset offset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		assert(self.isDescendant(of: view), "The current view must be a descendant of the specified view to pin it correctly.")
		
		let constraint = self.centerYAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.centerYAnchor : view.centerYAnchor,
			constant: offset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Aligns the current view to the horizontal center of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: For aligning upwards, use a negative value for `inset` and for aligning downwards, use a positive value.
	///
	/// - Parameters:
	///   - view: The view you want to align with. It has to be an ancestor of current view.
	///   - offset: The offset by which you want to align updward or downward. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to align relative to the `safeAreaLayoutGuide` or not.
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func align(
		toHorizontalCenterOf view: UIView,
		withOffset offset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		assert(self.isDescendant(of: view), "The current view must be a descendant of the specified view to pin it correctly.")
		
		let constraint = self.centerXAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.centerXAnchor : view.centerXAnchor,
			constant: offset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	
	/// Aligns the current view to the horizontal and vertical centers of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: For aligning rightwards, use a positive value for `verticalOffset` and for aligning leftwards, use a negative value.
	///
	/// > Tip: For aligning upwards, use a negative value for `horizontalOffset` and for aligning downwards, use a positive value.
	///
	/// - Parameters:
	///   - view: The view you want to align with. It has to be an ancestor of current view.
	///   - verticalOffset: The offset by which you want to align leftware or rightward. Defaults to 0.
	///   - horizontalOffset: The offset by which you want to align updward or downward. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to align relative to the `safeAreaLayoutGuide` or not.
	/// - Returns: A tuple of horizontal and vertical constraints that were created and activated.
	@discardableResult
	func align(
		toCenterOf view: UIView,
		withVerticalOffset verticalOffset: CGFloat = .zero,
		withHorizontalOffset horizontalOffset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> (
		verticalConstraint: NSLayoutConstraint,
		horizontalConstraint: NSLayoutConstraint
	) {
		let verticalConstraint = align(
			toVerticalCenterOf: view,
			withOffset: verticalOffset,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		
		let horizontalConstraint = align(
			toHorizontalCenterOf: view,
			withOffset: horizontalOffset,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		
		return (
			verticalConstraint,
			horizontalConstraint
		)
	}
}
