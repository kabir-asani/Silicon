//
//  File.swift
//  
//
//  Created by Kabir Asani on 03/08/24.
//

import UIKit

public extension UIView {
	
	/// Fixes the width of the current view to the passed in `width` argument.
	///
	///
	/// > Important: `width` has to be a non-negative value. A negative value may lead to undefined behaviour.
	///
	/// - Parameter width: The width you want this view to be of. It has be a non-negative value.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func fixWidth(
		to width: CGFloat
	) -> NSLayoutConstraint {
		assert(width >= 0, "Width has to be a non-negative value.")
		
		let constraint = self.widthAnchor.constraint(equalToConstant: width)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Fixes the height of the current view to the passed in `height` argument.
	///
	///
	/// > Important: `height` has to be a non-negative value. A negative value may lead to undefined behaviour.
	///
	/// - Parameter height: The height you want this view to be of. It has be a non-negative value.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func fixHeight(
		to height: CGFloat
	) -> NSLayoutConstraint {
		assert(height >= 0, "Height has to be a non-negative value.")
		
		let constraint = self.heightAnchor.constraint(equalToConstant: height)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Matches the height of the current view to be equal to the height of the passed in `view` argument.
	///
	///
	/// > Tip: A negative value for `extra` will shrink the current view and a postiive portion will expand it.
	///
	/// - Parameters:
	///   - view: The view you want to match the height with.
	///   - extra: The additional amount by which the current view's width should exceed (or shrink) by. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to match relative to the `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func match(
		heightOf view: UIView,
		withExtraPortion extra: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.heightAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.heightAnchor : view.heightAnchor,
			constant: extra
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Matches the width of the current view to be equal to the width of the passed in `view` argument.
	///
	///
	/// > Tip: A negative value for `extra` will shrink the current view and a postiive portion will expand it.
	///
	/// - Parameters:
	///   - view: The view you want to match the width with.
	///   - extra: The additional amount by which the current view's width should exceed (or shrink) by. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to match relative to the `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func match(
		widthOf view: UIView,
		withExtraPortion extra: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.widthAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.widthAnchor : view.widthAnchor,
			constant: extra
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Matches the width of the current view to be equal to the height of the passed-in `view` argument.
	///
	///
	/// > Tip: A negative value for `extra` will shrink the current view and a postiive portion will expand it.
	///
	/// - Parameters:
	///   - view: The view you want to match the current view's height to its width.
	///   - extra: The additional amount by which the current view's height should exceed (or shrink) by. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to match relative to the `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func matchWidth(
		toHeightOf view: UIView,
		withExtraPortion extra: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.widthAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.heightAnchor : view.heightAnchor,
			constant: extra
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Matches the width of the current view to be equal to the height of the passed in `view` argument.
	///
	///
	/// > Tip: A negative value for `extra` will shrink the current view and a postiive portion will expand it.
	///
	/// - Parameters:
	///   - view: The view you want to match the current view's height to its width.
	///   - extra: The additional amount by which the current view's width should exceed (or shrink) by. Defaults to 0.
	///   - safeAreaEnabled: A flag indicating whether to match relative to the `safeAreaLayoutGuide` or not.
	///
	/// - Returns: The constraint that was created and activated.
	func matchHeight(
		toWidthOf view: UIView,
		withExtraPortion extra: CGFloat = .zero,
		byBeingSafeAreaAware safeAreaEnabled: Bool = false
	) -> NSLayoutConstraint {
		let constraint = self.heightAnchor.constraint(
			equalTo: safeAreaEnabled ? view.safeAreaLayoutGuide.widthAnchor : view.widthAnchor,
			constant: extra
		)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Matches both the width and height of the current view to be equal to `side`.
	///
	///
	/// > Important: A negative value for `side` may cause undefined behavior.
	///
	/// - Parameters:
	///   - view: The view you want to match the current view's height to its width.
	///   - side: The height and width that you want for your current view. It has to be a non-negative value. Defaults to 0.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func squareOff(
		withSide side: CGFloat
	) -> (
		widthConstraint: NSLayoutConstraint,
		heightConstraint: NSLayoutConstraint
	) {
		assert(side >= 0, "Side has to be a non-negative value.")
		
		let widthConstraint = fixWidth(to: side)
		let heightConstraint = fixHeight(to: side)
		
		return (
			widthConstraint,
			heightConstraint
		)
	}
	
	/// Restricts the width of the current view to be above (inclusive) the given threshold `width`.
	///
	///
	/// > Important: A negative value for `width`may  cause undefined behaviour.
	///
	/// - Parameters:
	///   - width: The threshold width for the current view. It has to be a non-negative value.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func restrictWidth(
		toAbove width: CGFloat
	) -> NSLayoutConstraint {
		assert(width >= 0, "Width has to be a non-negative value.")
		
		let constraint = self.widthAnchor.constraint(greaterThanOrEqualToConstant: width)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Restricts the height of the current view to be above (inclusive) the given threshold `height`.
	///
	///
	/// > Important: A negative value for `height` may cause undefined behaviour.
	///
	/// - Parameters:
	///   - height: The threshold height for the current view. It has to be a non-negative value.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func restrictHeight(
		toAbove height: CGFloat
	) -> NSLayoutConstraint {
		assert(height >= 0, "Height has to be a non-negative value.")
		
		let constraint = self.heightAnchor.constraint(greaterThanOrEqualToConstant: height)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Restricts the width of the current view to be below (inclusive) the given threshold `width`.
	///
	///
	/// > Important: A negative value for `width` may cause undefined behaviour.
	///
	/// - Parameters:
	///   - width: The threshold width for the current view. It has to be a non-negative value.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func restrictWidth(
		toWithin width: CGFloat
	) -> NSLayoutConstraint {
		assert(width >= 0, "Width has to be a non-negative value.")
		
		let constraint = self.widthAnchor.constraint(lessThanOrEqualToConstant: width)
		
		activateConstraint(constraint)
		
		return constraint
	}
	
	/// Restricts the width of the current view to be below (inclusive) the given threshold `width`.
	///
	///
	/// > Important: A negative value for `height` may  cause undefined behaviour.
	///
	/// - Parameters:
	///   - height: The threshold height for the current view. It has to be a non-negative value.
	///
	/// - Returns: The constraint that was created and activated.
	@discardableResult
	func restrictHeight(
		toWithin height: CGFloat
	) -> NSLayoutConstraint {
		assert(height >= 0, "Height has to be a non-negative value.")
		
		let constraint = self.heightAnchor.constraint(lessThanOrEqualToConstant: height)
		
		activateConstraint(constraint)
		
		return constraint
	}
}
