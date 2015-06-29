//
//  PhotoMozaic.swift
//  PhotoMozaic
//
//  Created by Stephane on 26/06/2015.
//  Copyright (c) 2015 fettle. All rights reserved.
//

import UIKit

@IBDesignable
public class PhotoMozaic: UIView {
    
    
    @IBInspectable public var textColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.numberLabel.textColor = self.textColor
        }
    }
    @IBInspectable public var backgroundColorLabel: UIColor = UIColor.blackColor().colorWithAlphaComponent(0.70) {
        didSet {
            self.numberLabel.backgroundColor = self.backgroundColorLabel
        }
    }
    @IBInspectable public var margin: UInt = 0 {
        didSet {
            self.createConstraints()
        }
    }
    public var font: UIFont = UIFont.systemFontOfSize(40)
    public var photos: [PhotoMozaicItem] = [] {
        didSet {
            self.createConstraints()
        }
    }
    public var contentPhotoMode: UIViewContentMode = UIViewContentMode.ScaleAspectFill {
        didSet {
            self.img1.contentMode = self.contentPhotoMode
            self.img2.contentMode = self.contentPhotoMode
            self.img3.contentMode = self.contentPhotoMode
            self.img4.contentMode = self.contentPhotoMode
        }
    }
    public var delegate: PhotoMozaicDelegate?
    
    // MARK: - init
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.createSubviews()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.createSubviews()
    }
    
    // MARK: - private fields
    
    private var numberLabel: UILabel!
    private var img1: UIImageView!
    private var img2: UIImageView!
    private var img3: UIImageView!
    private var img4: UIImageView!
    
    // MARK: - Action TapGesture
    
    func img1TapHandler(gestureRecognizer: UIGestureRecognizer) {
        self.delegate?.photoMozaicSelected(0, sender: self.img1)
    }
    
    func img2TapHandler(gestureRecognizer: UIGestureRecognizer) {
        self.delegate?.photoMozaicSelected(1, sender: self.img2)
    }
    
    func img3TapHandler(gestureRecognizer: UIGestureRecognizer) {
        self.delegate?.photoMozaicSelected(2, sender: self.img3)
    }
    
    func img4TapHandler(gestureRecognizer: UIGestureRecognizer) {
        self.delegate?.photoMozaicSelected(3, sender: self.img4)
    }
    
    // MARK: - private method
    private func createSubviews() {
        self.img1 = UIImageView()
        self.img1.clipsToBounds = true
        self.img1.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.img1.contentMode = self.contentPhotoMode
        self.img1.userInteractionEnabled = true
        self.addSubview(self.img1)
        
        self.img1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("img1TapHandler:")))
        
        self.img2 = UIImageView()
        self.img2.clipsToBounds = true
        self.img2.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.img2.contentMode = self.contentPhotoMode
        self.img2.userInteractionEnabled = true
        self.addSubview(self.img2)
        
        self.img2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("img2TapHandler:")))
        
        self.img3 = UIImageView()
        self.img3.clipsToBounds = true
        self.img3.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.img3.contentMode = self.contentPhotoMode
        self.img3.userInteractionEnabled = true
        self.addSubview(self.img3)
        
        self.img3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("img3TapHandler:")))
        
        self.img4 = UIImageView()
        self.img4.clipsToBounds = true
        self.img4.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.img4.contentMode = self.contentPhotoMode
        self.img4.userInteractionEnabled = true
        self.addSubview(self.img4)
        
        self.img4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("img4TapHandler:")))
        
        self.numberLabel = UILabel()
        self.numberLabel.font = self.font
        self.numberLabel.textColor = self.textColor
        self.numberLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.numberLabel.textAlignment = NSTextAlignment.Center
        self.numberLabel.backgroundColor = self.backgroundColorLabel
        self.numberLabel.userInteractionEnabled = true
        self.addSubview(self.numberLabel)
        
        self.numberLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("img4TapHandler:")))
        
        self.createConstraints()
    }
    
    private func createConstraints() {
        self.removeAllConstraints(self, isSuperView: true)
        
        var views: [String: UIView] = ["img1":img1, "img2":img2, "img3":img3, "img4":img4, "lbl": self.numberLabel]
        
        if self.photos.count > 0 {
            self.img1.setPhotoMozaicItem(self.photos[0])
        }
        
        if self.photos.count > 1 {
            self.img2.setPhotoMozaicItem(self.photos[1])
        }
        
        if self.photos.count > 2 {
            self.img3.setPhotoMozaicItem(self.photos[2])
        }
        
        if self.photos.count > 3 {
            self.img4.setPhotoMozaicItem(self.photos[3])
        }

        var cmargin = ""
        if self.margin > 0 {
            cmargin = "-(\(self.margin))-"
        }
        
        switch self.photos.count {
        case 1:
            self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[img1]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
            self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[img1]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
            break
            
        case 2:
            self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[img1]\(cmargin)[img2(==img1)]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
            self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[img1]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
            self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[img2]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
            break
            
        case 3:
            self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[img1]\(cmargin)[img2(==img1)]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
            self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[img1]\(cmargin)[img3(==img1)]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
            self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[img1]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
            self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[img2]\(cmargin)[img3(==img2)]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
            break
            
        default:
            if self.photos.count > 3{
                self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[img1]\(cmargin)[img2(==img1)]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
                self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[img1]\(cmargin)[img3]\(cmargin)[img4(==img3)]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
                self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[img1]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
                self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[img2]\(cmargin)[img3(==img2)]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
                self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[img2]\(cmargin)[img4(==img2)]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
                self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[img3]\(cmargin)[lbl]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
                self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[img2]\(cmargin)[lbl]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
            }
            break
        }
        
        
        if self.photos.count > 4 {
            self.numberLabel.text = "+\(self.photos.count-4)"
            self.numberLabel.hidden = false
        }
        else {
            self.numberLabel.text = ""
            self.numberLabel.hidden = true
        }
    }
    
    private func removeAllConstraints(view: UIView, isSuperView: Bool) {
        for child in view.subviews {
            self.removeAllConstraints(child as! UIView, isSuperView: false)
        }
        
        if isSuperView {
            for c in view.constraints(){
                let cc = c as! NSLayoutConstraint
                if cc.secondItem != nil {
                    view.removeConstraint(cc)
                }
            }
        }
        else {
            view.removeConstraints(view.constraints())
        }
    }
    
    private func imageWithColor(color: UIColor, size: CGSize) -> UIImage{
        var rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        var context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
    
        let img = UIGraphicsGetImageFromCurrentImageContext()
    
        UIGraphicsEndImageContext()
    
        return img
    }

    // MARK: - prepareForInterfaceBuilder
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.photos = [
            PhotoMozaicItem(image: imageWithColor(UIColor.purpleColor(), size: CGSize(width: 10, height: 10))),
            PhotoMozaicItem(image: imageWithColor(UIColor.yellowColor(), size: CGSize(width: 10, height: 10))),
            PhotoMozaicItem(image: imageWithColor(UIColor.blueColor(), size: CGSize(width: 10, height: 10))),
            PhotoMozaicItem(image: imageWithColor(UIColor.greenColor(), size: CGSize(width: 10, height: 10))),
            PhotoMozaicItem(url: ""),
            PhotoMozaicItem(url: ""),
            PhotoMozaicItem(url: ""),
            PhotoMozaicItem(url: ""),
            PhotoMozaicItem(url: ""),
            PhotoMozaicItem(url: "")
        ]
        self.createConstraints()
        self.img1.contentMode = UIViewContentMode.ScaleToFill
        self.img2.contentMode = UIViewContentMode.ScaleToFill
        self.img3.contentMode = UIViewContentMode.ScaleToFill
        self.img4.contentMode = UIViewContentMode.ScaleToFill
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
