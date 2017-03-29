//
//  FullscreenPictureViewController.swift
//  AwesomePictures2
//
//  Created by Evandro Harrison Hoffmann on 3/29/17.
//  Copyright © 2017 Mindvalley. All rights reserved.
//

import UIKit

class FullscreenPictureViewController: UIViewController {

    @IBOutlet weak var pictureImageView: UIImageView!
    
    var imageObject: ImageObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.startLoadingAnimation()
        _ = pictureImageView.setImage(imageObject?.standardResolution) { (image) in
            self.view.stopLoadingAnimation()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
