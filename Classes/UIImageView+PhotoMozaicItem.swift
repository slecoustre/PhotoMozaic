//
//  UIImageView+PhotoMozaicItem.swift
//  PhotoMozaic
//
//  Created by Stephane on 26/06/2015.
//  Copyright (c) 2015 fettle. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func setPhotoMozaicItem(item: PhotoMozaicItem) {
        if item.image != nil {
            self.image = item.image!
        }
        else if item.url != nil {
            self.sd_setImageWithURL(NSURL(string: item.url!))
        }
    }
}