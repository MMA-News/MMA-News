//
//  BannerService.swift
//  MMA_News
//
//  Created by IOS Developer on 09.11.2023.
//
import Router
import UIKit

final class BannerService {
	
	private var newWindow: UIWindow = {
		$0.rootViewController = UIViewController()
		$0.windowLevel = .normal + 1
		$0.makeKeyAndVisible()
		$0.isHidden = true
		return $0
	}(UIWindow(windowScene: UIApplication.shared.windows.first!.windowScene!))
	
	func setup(state: State) {
		guard let currentVC = newWindow.rootViewController else {
			return
		}
		
		switch state {
			case let .show(viewConstraints):
				if !viewConstraints.view.isDescendant(of: currentVC.view) {
					newWindow.rootViewController?.view.addSubview(viewConstraints.view)
				}
				setupConstraints(with: viewConstraints)
				newWindow.isHidden = false
				
			case .hide:
				newWindow.isHidden = true
		}
		currentVC.view.backgroundColor = DesignSystem.Color.grayNight500
	}
	
	private func setupConstraints(with viewConstraints: ViewConstraints) {
		viewConstraints.view.snp.makeConstraints {
			$0.center.equalToSuperview()
			$0.height.equalTo(viewConstraints.height)
			$0.width.equalTo(viewConstraints.width)
		}
		viewConstraints.view.cornerRadius(
			corners: .allCorners,
			radius: DesignSystem.Guid.cornerRadius
		)
	}
	
	enum State {
		case show(ViewConstraints)
		case hide
	}
	
	struct ViewConstraints {
		let view: UIView
		let width: CGFloat
		let height: CGFloat
	}
}

