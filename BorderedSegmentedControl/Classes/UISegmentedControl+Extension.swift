//
//  UISegmentedControl+Extension.swift
//  BorderedSegmentedControl
//
//  Created by Mohammed Shakeer on 10/03/20.
//

import UIKit

public extension UISegmentedControl {

    @IBInspectable
    var normalColor: UIColor? {
         get {
            return nil
         }
        set {
            if let newColor = newValue {
                setUp(for: .foregroundColor, value: newColor, state: .normal)
            }
        }
    }

    @IBInspectable
    var selectedColor: UIColor? {
        get {
            return nil
        }
        set {
            if let newColor = newValue {
                setUp(for: NSAttributedString.Key.foregroundColor, value: newColor, state: .selected)
                setupBorder(for: newColor)
            }
        }
    }

    var normalFont: UIFont? {
         get {
            return self.titleTextAttributes(for: .normal)?[NSAttributedString.Key.font] as? UIFont
         }
         set {
            if let newFont = newValue {
                setUp(for: .font, value: newFont, state: .normal)
            }
         }
    }

    var selectedFont: UIFont? {
         get {
            return self.titleTextAttributes(for: .selected)?[NSAttributedString.Key.font] as? UIFont
         }
         set {
            if let newFont = newValue {
                setUp(for: .font, value: newFont, state: .selected)
            }
         }
    }

    /// Set layoutDirection to layout the UI properly when device language direction is rightToLeft
    var layoutDirection: UIUserInterfaceLayoutDirection {
        get {
            return UIView.userInterfaceLayoutDirection(for: semanticContentAttribute)
        }
        set {
            semanticContentAttribute = (newValue == .leftToRight) ? .forceLeftToRight : .forceRightToLeft
            borderLayer()?.frame = selectedSegmentBottomLayerFrame()
        }
    }

    /// redraws layout in passed frame
    func reloadLayout(in frame: CGRect? = nil) {
        borderLayer()?.frame = selectedSegmentBottomLayerFrame(segmentFrame: frame)
    }

    /**
     sets up title text attributes for segmented control
     - Parameter key: key to be set in attributes
     - Parameter value: value to be set for the passed key attribute
     - Parameter state: state of the segmented control to which attributes to be set
     */
    func setUp<T>(for key: NSAttributedString.Key, value: T, state: UIControl.State) {

        // combine old attributes with new attributes to avoid overriding old attributes set
        var newAttributes: [NSAttributedString.Key: Any] = [key: value]
        if let oldAttributes = titleTextAttributes(for: state) as? [NSAttributedString.Key: Any] {
            newAttributes = oldAttributes + newAttributes
        }
        setTitleTextAttributes(newAttributes, for: state)
    }
    
    /**
     sets up bottom border for the segmented control
     - Parameter color: color to be set for the bottom border layer
     */
    func setupBorder(for color: UIColor) {
                
        if borderLayer() == nil {
            layer.addSublayer(TaggedCALayer())
        }
        guard let bottomBorder = borderLayer() else { return }
        
        bottomBorder.frame = selectedSegmentBottomLayerFrame()
        bottomBorder.backgroundColor = color.cgColor
        tintColor = UIColor.clear
        if #available(iOS 13.0, *) {
            selectedSegmentTintColor = UIColor.clear
        }
        addTarget(self, action: #selector(valueChanged), for: .valueChanged)
    }

    func borderLayer() -> CALayer? {
        layer.sublayers?.filter { $0.isKind(of: TaggedCALayer.classForCoder()) }.first
    }
    
    @objc func valueChanged() {
        borderLayer()?.frame = selectedSegmentBottomLayerFrame()
    }

    var borderLayerHeight: Int {
        5
    }
    
    func selectedSegmentBottomLayerFrame(segmentFrame: CGRect? = nil) -> CGRect {

        let rect = segmentFrame ?? frame
        let segmentWidth = Int(rect.width)/numberOfSegments
        var xSpace = segmentWidth*selectedSegmentIndex
        
        if #available(iOS 9.0, *) {
            if UIView.userInterfaceLayoutDirection(for: semanticContentAttribute) == UIUserInterfaceLayoutDirection.rightToLeft {
                xSpace = (numberOfSegments - selectedSegmentIndex - 1) * segmentWidth
            }
        }

        return CGRect(x: xSpace, y: Int(bounds.height) - borderLayerHeight, width: segmentWidth, height: borderLayerHeight)
    }
}

class TaggedCALayer: CALayer { }

extension Dictionary {

    static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var result = lhs
        rhs.forEach { result[$0] = $1 }
        return result
    }
}
