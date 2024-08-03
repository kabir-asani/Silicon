//
//  Pin.swift
//  
//
//  Created by Kabir Asani on 03/08/24.
//

import UIKit

extension UIView {
	/// Pins the current view to the top edge of the specified `view`.
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	/// > Tip: To pin outward, use a positive `inset` value. To pin inward, use a negative value.
	///
	/// - Parameters:
	///   - view: The ancestor view to which the current view should be pinned.
	///   - inset: The offset for pinning, where a positive value pins away and a negative value pins inward. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to pin relative to the `safeAreaLayoutGuide` or not.
	/// - Returns: The activated constraint representing the pinning operation.
	@discardableResult
	func pin(
		toTopOf view: UIView,
		withInset inset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = true
	) -> NSLayoutConstraint {
		assert(self.isDescendant(of: view), "The current view must be a descendant of the specified view to pin it correctly.")
		
		let constraint = self.topAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor,
			constant: inset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Pins the current view to the bottom edge of the specified `view`.
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	/// > Tip: To pin outward, use a positive `inset` value. To pin inward, use a negative value.
	///
	/// - Parameters:
	///   - view: The ancestor view to which the current view should be pinned.
	///   - inset: The offset for pinning, where a positive value pins away and a negative value pins inward. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to pin relative to the `safeAreaLayoutGuide` or not.
	/// - Returns: The activated constraint representing the pinning operation.
	@discardableResult
	func pin(
		toBottomOf view: UIView,
		withInset inset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = true
	) -> NSLayoutConstraint {
		assert(self.isDescendant(of: view), "The current view must be a descendant of the specified view to pin it correctly.")
		
		let constraint = self.bottomAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor,
			constant: inset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Pins the current view to the left edge of the specified `view`.
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	/// > Tip: To pin outward, use a positive `inset` value. To pin inward, use a negative value.
	///
	/// - Parameters:
	///   - view: The ancestor view to which the current view should be pinned.
	///   - inset: The offset for pinning, where a positive value pins away and a negative value pins inward. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to pin relative to the `safeAreaLayoutGuide` or not.
	/// - Returns: The activated constraint representing the pinning operation.

	@discardableResult
	func pin(
		toLeftOf view: UIView,
		withInset inset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = true
	) -> NSLayoutConstraint {
		assert(self.isDescendant(of: view), "The current view must be a descendant of the specified view to pin it correctly.")
		
		let constraint = self.leadingAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor,
			constant: inset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Pins the current view to the right of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: For pinning away, use a postive value for `inset` and for pinning into, use a negative value.
	///
	/// - Parameters:
	///   - view: The view you want to pin onto. It has to be an ancestor of current view.
	///   - inset: The inset with which you want to pin away (or into) by. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to pin relative to the `safeAreaLayoutGuide` or not.
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func pin(
		toRightOf view: UIView,
		withInset inset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = true
	) -> NSLayoutConstraint {
		assert(self.isDescendant(of: view), "The current view must be a descendant of the specified view to pin it correctly.")
		
		let constraint = self.trailingAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor,
			constant: inset
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Pins the current view to symmetrically to the top and bottom of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: For pinning away, use a postive value for `inset` and for pinning into, use a negative value.
	///
	/// - Parameters:
	///   - view: The view you want to pin onto. It has to be an ancestor of current view.
	///   - inset: The inset with which you want to pin away (or into) by. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to pin relative to the `safeAreaLayoutGuide` or not.
	/// - Returns: A tuple of top and bottom constraints that were created and activated.
	@discardableResult
	func pin(
		verticallySymmetricTo view: UIView,
		withInset inset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = true
	) -> (
		topConstraint: NSLayoutConstraint,
		bottomConstraint: NSLayoutConstraint
	) {
		assert(self.isDescendant(of: view), "The current view must be a descendant of the specified view to pin it correctly.")
		
		let topConstraint = pin(
			toTopOf: view,
			withInset: inset,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		let bottomConstraint = pin(
			toBottomOf: view,
			withInset: -inset,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		
		return (
			topConstraint: topConstraint,
			bottomConstraint: bottomConstraint
		)
	}
	
	/// Pins the current view to symmetrically to the left and right of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: For pinning away, use a postive value for `inset` and for pinning into, use a negative value.
	///
	/// - Parameters:
	///   - view: The view you want to pin onto. It has to be an ancestor of current view.
	///   - inset: The inset with which you want to pin away (or into) by. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to pin relative to the `safeAreaLayoutGuide` or not.
	/// - Returns: A tuple of left and right constraints that were created and activated.
	@discardableResult
	func pin(
		horizontallySymmetricTo view: UIView,
		withInset inset: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = true
	) -> (
		leftConstraint: NSLayoutConstraint,
		rightConstraint: NSLayoutConstraint
	) {
		let leftConstraint = pin(
			toLeftOf: view,
			withInset: inset,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		let rightConstraint = pin(
			toBottomOf: view,
			withInset: -inset,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		
		return (
			leftConstraint,
			rightConstraint
		)
	}
	
	/// Pins the current view to the top, bottom, left and right of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must be an ancestor of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: For pinning away, use a postive value for `inset` and for pinning into, use a negative value.
	///
	/// - Parameters:
	///   - view: The view you want to pin onto. It has to be an ancestor of current view.
	///   - insets: The insets with which you want to configure the constraints. Defaults to ``UIEdgeInsets.zero``.
	///   - safeAreaEnabled: A flag indicating whether to pin relative to the `safeAreaLayoutGuide` or not.
	/// - Returns: A tuple of top, bottom, left and right constraints that were created and activated.
	@discardableResult
	func pin(
		to view: UIView,
		withInsets insets: UIEdgeInsets = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> (
		topConstraint: NSLayoutConstraint,
		bottomConstraint: NSLayoutConstraint,
		rightConstraint: NSLayoutConstraint,
		leftConstraint: NSLayoutConstraint
	) {
		let topConstraint = pin(
			toTopOf: view,
			withInset: insets.top,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		let bottomConstraint = pin(
			toBottomOf: view,
			withInset: insets.bottom,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		let leftConstraint = pin(
			toLeftOf: view,
			withInset: insets.left,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		let rightConstraint = pin(
			toRightOf: view,
			withInset: insets.right,
			byBeingSafeAreaAware: safeAreaEnabled
		)
		
		return (
			topConstraint,
			bottomConstraint,
			rightConstraint,
			leftConstraint
		)
	}
}
