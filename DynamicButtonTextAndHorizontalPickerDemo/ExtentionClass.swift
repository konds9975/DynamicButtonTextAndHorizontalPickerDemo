//
//  ExtentionClass.swift
//  Fabbit
//
//  Created by Inkswipe on 6/4/18.
//  Copyright © 2018 Fortune4 Technologies. All rights reserved.
//

import Foundation
import UIKit

let colorButton = UIColor(displayP3Red: 136/256.0, green: 134/256.0, blue: 237/256.0, alpha: 1)


extension UIViewController {

    func hideNavigation()
    {
         self.navigationController?.navigationBar.isHidden = true
    }

}


extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
extension UIView {
    
    
    
    @IBInspectable
    
    var dotedBorderColor: UIColor? {
        
        get {
            
            if let color = layer.borderColor {
                
                return UIColor(cgColor: color)
                
            }
            
            return nil
            
        }
        
        set {
            
            if let color = newValue
            {
                if color == colorButton
                {
                
                    for layer in self.layer.sublayers!
                    {
                        if let ll = layer as? CAShapeLayer
                        {
                            ll.removeFromSuperlayer()
                        }
                    }
                    
                }
                else
                {
                
                    layer.borderColor = color.cgColor
                    let yourViewBorder = CAShapeLayer()
                    yourViewBorder.strokeColor = color.cgColor
                    yourViewBorder.lineDashPattern = [2, 2]
                    yourViewBorder.frame = self.bounds
                    yourViewBorder.fillColor = nil
                    yourViewBorder.path = UIBezierPath(rect: self.bounds).cgPath
                    self.layer.addSublayer(yourViewBorder)
                }
                
            }
                
            else
            {
                
                layer.borderColor = nil
                
            }
            
        }
        
    }
    
}



//MARK:- Scroll Direction Dectable


enum ScrollDirection {
    case up, left, down, right, none
}

protocol ScrollDirectionDetectable {
    associatedtype ScrollViewType: UIScrollView
    var scrollView: ScrollViewType { get }
    var scrollDirection: ScrollDirection { get set }
    var lastContentOffset: CGPoint { get set }
}

extension ScrollDirectionDetectable {
    var scrollView: ScrollViewType {
        return self.scrollView
    }
}
