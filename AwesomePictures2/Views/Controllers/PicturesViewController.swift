//
//  PicturesViewController.swift
//  AwesomePictures2
//
//  Created by Evandro Harrison Hoffmann on 3/22/17.
//  Copyright © 2017 Mindvalley. All rights reserved.
//

import UIKit

class PicturesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var images = [ImageObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ImageObject.fetchImages { (images) in
            self.images = images
            self.collectionView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let viewController = segue.destination as? FullscreenPictureViewController {
            if let cell = sender as? PictureCollectionViewCell {
                if let indexPath = collectionView.indexPath(for: cell) {
                    viewController.imageObject = images[indexPath.item]
                }
            }
        }
        
    }

}

// MARK: - CollectionView DataSource

extension PicturesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "picture", for: indexPath) as! PictureCollectionViewCell
        
        cell.startLoadingAnimation()
        _ = cell.pictureImageView.setImage(images[indexPath.item].standardResolution) { (image) in
            //here we are going to do something after it's loaded
            cell.stopLoadingAnimation()
        }
        
        return cell
    }
    
}



