//
//  PhotoMozaicItem.swift
//  PhotoMozaic
//
//  Created by Stephane on 26/06/2015.
//  Copyright (c) 2015 fettle. All rights reserved.
//

import UIKit

class PhotoMozaicItem {
    private init() {
    
    }
    
    var url: String?
    var image: UIImage?
    
    init(url: String) {
        self.url = url
    }
    
    init(image: UIImage) {
        self.image = image
    }
}