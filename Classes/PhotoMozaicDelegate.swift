//
//  PhotoMozaicDelegate.swift
//  PhotoMozaic
//
//  Created by Stephane on 26/06/2015.
//  Copyright (c) 2015 fettle. All rights reserved.
//

import Foundation
import UIKit

public protocol PhotoMozaicDelegate {
    func photoMozaicSelected(index: Int, sender: UIImageView)
}