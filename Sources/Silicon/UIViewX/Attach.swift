//
//  Attach.swift
//
//
//  Created by Kabir Asani on 03/08/24.
//

import UIKit

public extension UIView {
	/// Attaches the top of the current view to the bottom of the passed in `view` argument.
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	/// > Tip: A positive margin pushes the views apart and a negative margin causes them to overlap.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: A flag indicating whether to attach to the `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attachTop(
		toBottomOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.topAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Attaches the top of the current view to the top of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	/// > Tip: A positive margin pushes the current view downwards and a negative margin pushes it upwards.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: A flag indicating whether to attach to the `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attach(
		toTopOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.topAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Attaches the bottom of the current view to the top of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the views apart and a negative margin causes them to overlap.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: A flag indicating whether to attach to the `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attachBottom(
		toTopOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.bottomAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Attaches the bottom of the current view to the bottom of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the current view downwards and a negative margin pushes it upwards.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: A flag indicating whether to attach to the `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attach(
		toBottomOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.bottomAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Attaches the left of the current view to the right of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the views apart and a negative margin causes them to overlap.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: A flag indicating whether to attach to the `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attachLeft(
		toRightOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.leftAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.rightAnchor : view.rightAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Attaches the left of the current view to the left of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the current view leftwards and a negative margin pushes it rightwards.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: A flag indicating whether to attach to the `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attach(
		toLeftOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.leftAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.leftAnchor : view.leftAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Attaches the right of the current view to the left of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the views apart and a negative margin causes them to overlap.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: A flag indicating whether to attach to the `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attachRight(
		toLeftOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.rightAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.leftAnchor : view.leftAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Attaches the right of the current view to the right of the passed in `view` argument.
	///
	///
	/// > Important: The `view` parameter must at least has to be a sibling (or ancestor) of the current view. Ensure the view hierarchy is set up correctly before calling this method.
	///
	///
	/// > Tip: A positive margin pushes the current view leftwards and a negative margin pushes it rightwards.
	///
	/// - Parameters:
	///   - view: The view you want to attach with. It at least has to be a sibling (or ancestor) of the current view.
	///   - margin: The margin you want between the current view and the passed in `view`.
	///   - safeAreaEnabled: A flag indicating whether to attach to the `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func attach(
		toRightOf view: UIView,
		withMargin margin: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.rightAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.rightAnchor : view.rightAnchor,
			constant: margin
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
}
