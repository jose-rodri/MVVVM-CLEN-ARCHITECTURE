//
//  CustomButton.swift
//  Reto_Tecnico_Jose_QR
//
//  Created by Jose Leoncio Quispe Rodriguez on 3/05/22.
//

import Foundation
import UIKit

@IBDesignable
public class CustomButton: UIButton {
    
    @IBInspectable
    var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable
    var shadowColor: UIColor = UIColor.black {
        didSet {
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOpacity = 1
            layer.shadowOffset = CGSize(width: 0, height: 3)
            layer.shadowRadius = 1.0
        }
    }
    
    @IBInspectable
    var disabledTextColor: UIColor = UIColor.black {
        didSet {
            setTitleColor(disabledTextColor, for: .disabled)
        }
    }
    
}
