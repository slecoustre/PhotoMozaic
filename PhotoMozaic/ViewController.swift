//
//  ViewController.swift
//  PhotoMozaic
//
//  Created by Stephane on 26/06/2015.
//  Copyright (c) 2015 fettle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PhotoMozaicDelegate {
    @IBOutlet weak var mozaicView: PhotoMozaic!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mozaicView.photos = [
            PhotoMozaicItem(url: "http://www.agencedeshalles.net/wp-content/uploads/2014/06/Louvre-Museum-Paris.jpg"),
            PhotoMozaicItem(url: "http://img0.mxstatic.com/wallpapers/944eb9e454b2a1c544d606adf4a9c59b_large.jpeg"),
            PhotoMozaicItem(url: "https://upload.wikimedia.org/wikipedia/commons/9/9f/Lille_maison_de_gille_le_boe.JPG"),
            PhotoMozaicItem(url: "https://journeyaroundtheglobe.files.wordpress.com/2013/06/img_2305.jpg"),
            PhotoMozaicItem(url: "https://upload.wikimedia.org/wikipedia/commons/f/f1/Chateau_Versailles_Galerie_des_Glaces.jpg"),
            PhotoMozaicItem(url: "https://upload.wikimedia.org/wikipedia/commons/f/f1/Chateau_Versailles_Galerie_des_Glaces.jpg")
        ]
        
        self.mozaicView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func photoMozaicSelected(index: Int, sender: UIImageView) {
        println(index)
    }

    
}

