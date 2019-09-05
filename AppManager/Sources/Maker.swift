//
//  Maker.swift
//  AppManager
//
//  Created by Xinus on 07/27/2019.
//  Copyright (c) 2019 XINUS.WANG. All rights reserved.
//

import Foundation
import UIKit

public class Maker: ComponentType, Sharable {
    public static let shared = Maker()
    
    private init() {
        
    }
}

public extension AppManager {
    var maker: Maker {
        return Maker.shared
    }
}

//MARK: - Image Maker
public extension Maker {
    func image(filled color: UIColor, size: CGSize = CGSize(width: 8, height: 8)) -> UIImage? {
        
        UIGraphicsBeginImageContext(size)

        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        color.setFill()
        context.fill(CGRect(origin: .zero, size: size))
        
        let genImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return genImage
    }
    
    func gradientImage(_ direction: GradientDirection, colors: [UIColor], size: CGSize = CGSize(width: 8, height: 8)) -> UIImage? {

        let colorSpaceRGB = CGColorSpaceCreateDeviceRGB()
        let cgColors = colors.map { (color) -> CGColor in
            return color.cgColor
        }
        
        guard let gradient = CGGradient(colorsSpace: colorSpaceRGB, colors: cgColors as CFArray, locations: nil) else {
            return nil
        }

        UIGraphicsBeginImageContext(size)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        let startPoint: CGPoint
        let endPoint: CGPoint
        
        switch direction {
        case .leftToRight:
            startPoint = CGPoint(x: 0, y: 0)
            endPoint = CGPoint(x: 1, y: 0)
        case .rightToLeft:
            startPoint = CGPoint(x: 1, y: 0.5)
            endPoint = CGPoint(x: 0, y: 0.5)
        case .topToBottom:
            startPoint = CGPoint(x: 0.5, y: 0)
            endPoint = CGPoint(x: 0.5, y: 1)
        case .bottomToTop:
            startPoint = CGPoint(x: 0.5, y: 1)
            endPoint = CGPoint(x: 0.5, y: 0)
        }
        
        context.scaleBy(x: size.width, y: size.height)
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: .drawsBeforeStartLocation)
        
        let genImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return genImage
    }

    func borderImage(filled color: UIColor, size: CGSize,
                     borderColor: UIColor? = nil, borderWidth: CGFloat = 0,
                     cornerRadis: CGFloat = 0) -> UIImage? {
        
        UIGraphicsBeginImageContext(size)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        let rect = CGRect(origin: .zero, size: size)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadis)
        path.lineWidth = borderWidth
        path.stroke()
        
        borderColor?.setStroke()
        color.setFill()

        context.drawPath(using: .fillStroke)
        
        let genImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let stretchableImage = genImage?.stretchableImage(withLeftCapWidth: Int(ceil(borderWidth)), topCapHeight: Int(ceil(borderWidth)))

        return stretchableImage
    }
}
