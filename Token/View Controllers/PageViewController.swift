//
//  PageViewController.swift
//  RLTV
//
//  Created by Jason Silberman on 11/29/17.
//  Copyright © 2017 Implicity. All rights reserved.
//

import UIKit

protocol PageableViewController {
	func canPage() -> Bool
}

final class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
	let pages: [UIViewController]
	
	var cursor: Int = 1
	
	init(pages: [UIViewController], transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey: Any]? = nil) {
		self.pages = pages
		super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
		
		dataSource = self
		delegate = self
		
		view.backgroundColor = .tokenBlue
		
		setViewControllers([pages[cursor]], direction: .forward, animated: false, completion: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return pages[cursor].preferredStatusBarStyle
	}
	
	override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
		return pages[cursor].supportedInterfaceOrientations
	}
	
	// MARK: Actions
	
	func next() {
		let nextCursor = cursor + 1
		
		guard nextCursor >= 0, nextCursor < pages.count else { return }
		
		cursor += 1
		
		setViewControllers([pages[cursor]], direction: .forward, animated: true, completion: nil)
	}
	
	func prev() {
		let nextCursor = cursor - 1
		
		guard nextCursor >= 0, nextCursor < pages.count else { return }
		
		cursor -= 1
		
		setViewControllers([pages[cursor]], direction: .reverse, animated: true, completion: nil)
	}
	
	// MARK: Data Source
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		
		let index = pages.index(of: viewController) ?? 0
		let nextIndex = index - 1
		
		guard nextIndex >= 0, nextIndex < pages.count else { return nil }
		
		return pages[nextIndex]
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		
		let index = pages.index(of: viewController) ?? 0
		let nextIndex = index + 1
		
		guard nextIndex >= 0, nextIndex < pages.count else { return nil }
		
		return pages[nextIndex]
	}
	
	// MARK: Delegate
	
	func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
		guard let viewController = previousViewControllers.first else { return }
		
		let index = pages.index(of: viewController) ?? 0
		
		cursor = index
	}
}
