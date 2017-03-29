//
//  UIView+Loading.swift
//  AwesomePictures
//
//  Created by Evandro Harrison Hoffmann on 2/22/17.
//  Copyright © 2017 Evandro Harrison Hoffmann. All rights reserved.
//

import UIKit

extension UIView {
    
    func startLoadingAnimation() {
        let activityView = UIActivityIndicatorView()
        activityView.color = .black
        activityView.center = CGPoint(x: self.frame.size.width/2-activityView.frame.size.width/2, y: self.frame.size.height/2-activityView.frame.size.height/2)
        activityView.startAnimating()
        self.addSubview(activityView)
    }
    
    func stopLoadingAnimation(){
        for view in subviews {
            if let view = view as? UIActivityIndicatorView {
                view.removeFromSuperview()
            }
        }
    }
    
}
