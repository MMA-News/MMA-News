//
//  DesignSystem.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 14.02.2023.
//

import UIKit

struct DesignSystem {
    
    struct Color {
        
		static let mainBlue: UIColor = UIColor(named: "mainBlue") ?? .white
        static let grayDay500: UIColor = UIColor(named: "grayDay500") ?? .white
        static let grayDay900: UIColor = UIColor(named: "grayDay900") ?? .white
        static let blueDay700: UIColor = UIColor(named: "blueDay700") ?? .white
        
        static let grayNight700: UIColor = UIColor(named: "grayNight700") ?? .white
        static let grayNight200: UIColor = UIColor(named: "grayNight200") ?? .white
        static let grayNight500: UIColor = UIColor(named: "grayNight500") ?? .white
        
        static let background: UIColor = UIColor(named: "background") ?? .white
        
        static let yellow900: UIColor = UIColor(named: "yellow900") ?? .white
        static let yellowPrimaryColorHover2: UIColor = UIColor(named: "yellowPrimaryColorHover2") ?? .white
        
        static let green900: UIColor = UIColor(named: "green900") ?? .white
        static let green500: UIColor = UIColor(named: "green500") ?? .white
        
        static let red500: UIColor = UIColor(named: "red500") ?? .white
        static let red900: UIColor = UIColor(named: "red900") ?? .white
        
        static let blur: UIColor = UIColor(named: "blur") ?? .white
    }
    
    struct Guid {
        
        static let horizontalPadding: CGFloat = 16
        static let verticalPadding: CGFloat = 16
        static let cornerRadius: CGFloat = 8
    }
    
    enum FontName: String {
        
        case RobotoMedium = "Roboto-Medium"
        case RobotoLight = "Roboto-Light"
        case RobotoRegular = "Roboto-Regular"
        case RobotoBold = "Roboto-Bold"
    }
    
    struct Image {
        
        static let map     : UIImage = UIImage(named: "map") ?? UIImage()
        static let clock   : UIImage = UIImage(named: "clock") ?? UIImage()
        static let calendar: UIImage = UIImage(named: "calendar") ?? UIImage()
    }
   
    struct Font {
        
        static func robotoMedium(size: CGFloat) -> UIFont {
            let font = UIFont(
                name: FontName.RobotoMedium.rawValue,
                size: size
            )
            ??
            UIFont.systemFont(ofSize: size)
            return font
        }
        
        static func robotoBold(size: CGFloat) -> UIFont {
            let font = UIFont(
                name: FontName.RobotoMedium.rawValue,
                size: size
            )
            ??
            UIFont.systemFont(ofSize: size)
            return font
        }
        
        static func robotoLight(size: CGFloat) -> UIFont {
            let font = UIFont(
                name: FontName.RobotoLight.rawValue,
                size: size
            )
            ??
            UIFont.systemFont(ofSize: size)
            return font
        }
        
        static func robotoRegular(size: CGFloat) -> UIFont {
            let font = UIFont(
                name: FontName.RobotoRegular.rawValue,
                size: size
            )
            ??
            UIFont.systemFont(ofSize: size)
            return font
        }
    }
}

public extension NSMutableAttributedString {
    func foregroundColor(_ color: UIColor) -> Self {
        let colorAttributed: [NSAttributedString.Key: Any] = [.foregroundColor: color]
        addAttributes(colorAttributed, range: string.fullRange())
        return self
    }
    
    func font(_ font: UIFont) -> Self {
        let colorAttributed: [NSAttributedString.Key: Any] = [.font: font]
        addAttributes(colorAttributed, range: string.fullRange())
        return self
    }
}

public extension String {
    
    func fullRange() -> NSRange {
        let range = (self as NSString).range(of: self)
        return range
    }
    
    var attributed: NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        return attributedString
    }
}

public extension String {
    
    func body14(color: UIColor) -> NSMutableAttributedString {
        let attributedString = self
            .attributed
            .foregroundColor(color)
            .font(DesignSystem.Font.robotoRegular(size: 14))
        return attributedString
    }
    
    func body12(color: UIColor) -> NSMutableAttributedString {
        let attributedString = self
            .attributed
            .foregroundColor(color)
            .font(DesignSystem.Font.robotoRegular(size: 12))
        return attributedString
    }
    
    func body10(color: UIColor) -> NSMutableAttributedString {
        let attributedString = self
            .attributed
            .foregroundColor(color)
            .font(DesignSystem.Font.robotoRegular(size: 10))
        return attributedString
    }
    
    func bodySmall(color: UIColor) -> NSMutableAttributedString {
        let attributedString = self
            .attributed
            .foregroundColor(color)
            .font(DesignSystem.Font.robotoRegular(size: 14))
        return attributedString
    }
    
    func H316(color: UIColor) -> NSMutableAttributedString {
        let attributedString = self
            .attributed
            .foregroundColor(color)
            .font(DesignSystem.Font.robotoRegular(size: 14))
        return attributedString
    }
    
    func H2(color: UIColor) -> NSMutableAttributedString {
        let attributedString = self
            .attributed
            .foregroundColor(color)
            .font(DesignSystem.Font.robotoBold(size: 20))
        return attributedString
    }
}
