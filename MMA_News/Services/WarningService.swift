//
//  WarningService.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 08.03.2023.
//
import Resolver
import UIKit
import Architecture

final class WarningService: BaseFeatureService<WarningService> {
    
    private let build = WarningViewBuilder.build()
    
    private lazy var warningView: WarningView? = build.view
    
    private var loaderWindow: UIWindow = {
        $0.rootViewController = UIViewController()
        $0.windowLevel = .normal + 1
        $0.makeKeyAndVisible()
        $0.isHidden = true
        return $0
    }(UIWindow(windowScene: UIApplication.shared.windows.first!.windowScene!))
    
    public var dismissCompletion: ClosureEmpty?
    
    public func present(with warningTextType: WarningTextType, dismiss: Bool) {
        guard let warningView = self.warningView else { return }
        self.loaderWindow.isHidden = false
        let warningViewHeight = warningTextType.text().string.heightText(plus: 25, font: .systemFont(ofSize: 13))
        build.viewManager.state = .createViewProperties(warningTextType.text())
        let heightTransform   = (warningViewHeight + 32)
        warningView.frame = CGRect(
            x     : 8,
            y     : -warningViewHeight,
            width : self.loaderWindow.bounds.width - 16,
            height: warningViewHeight
        )
        self.loaderWindow.rootViewController?.view.addSubview(warningView)
        self.animation(with: heightTransform)
        guard dismiss else { return }
        self.dismiss()
    }
    
    private func animation(with heightTransform: CGFloat){
        guard let warningView = self.warningView else { return }
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
            self.loaderWindow.rootViewController?.view.backgroundColor = DesignSystem.Color.blur
            warningView.transform = CGAffineTransform(translationX: 0, y: heightTransform)
        })
    }
    
    public func dismiss(with second: Double = 2){
        guard let warningView = self.warningView else { return }
        UIView.animate(withDuration: 0.4, delay: second, options: [], animations: {
            warningView.transform = .identity
            self.loaderWindow.rootViewController?.view.backgroundColor = .clear
        }, completion: { isFinish in
            guard isFinish else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.loaderWindow.isHidden = true
                self.loaderWindow.rootViewController?.view.subviews.forEach({ $0.removeFromSuperview() })
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.dismissCompletion?()
                }
            }
        })
    }
}

enum WarningTextType {
    
    case custom(NSAttributedString)
    
    public func text() -> NSAttributedString {
        switch self {
            case .custom(let errorText):
                return errorText
        }
    }
    
    public func backgroundColor() -> UIColor {
        switch self {
            case .custom:
                return DesignSystem.Color.green500
        }
    }
}
