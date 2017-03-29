//
//  ImageObject.swift
//  AwesomePictures
//
//  Created by Evandro Harrison Hoffmann on 2/15/17.
//  Copyright © 2017 Evandro Harrison Hoffmann. All rights reserved.
//

import Foundation
import AwesomeData

class ImageObject: NSObject {

    var thumbnail: String?
    var lowResolution: String?
    var standardResolution: String?
    
    // MARK: - Class functions
    
    func name(){
        
    }
    
    static func fetchImages(completed: ((_ images: [ImageObject])->Void)?){
        _ = AwesomeRequester.performRequest("https://www.instagram.com/evandroharrison/media/") { (data) in
            if let jsonObject = AwesomeParser.jsonObject(data) {
                var images = [ImageObject]()
                
                if let items = jsonObject["items"] as? [[String: Any]] {
                    for item in items {
                        if let image = item["images"] as? [String: Any] {
                            let imageObject = ImageObject()
                            
                            if let image = image["thumbnail"] as? [String: Any] {
                                imageObject.thumbnail = AwesomeParser.stringValue(image, key: "url")
                            }
                            
                            if let image = image["low_resolution"] as? [String: Any] {
                                imageObject.lowResolution = AwesomeParser.stringValue(image, key: "url")
                            }
                            
                            if let image = image["standard_resolution"] as? [String: Any] {
                                imageObject.standardResolution = AwesomeParser.stringValue(image, key: "url")
                            }
                            
                            images.append(imageObject)
                        }
                    }
                    completed?(images)
                }
            }
        }
    }
    
    
    
    
    
    
    
    
}
