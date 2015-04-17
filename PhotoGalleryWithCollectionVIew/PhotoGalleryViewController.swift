//
//  PhotoGalleryViewController.swift
//  PhotoGalleryWithCollectionVIew
//
//  Created by Frederik Jacques on 17/04/15.
//  Copyright (c) 2015 the-nerd. All rights reserved.
//

import UIKit

class PhotoGalleryViewController: UIViewController,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UIScrollViewDelegate
{

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Properties
    var images:[UIImage]
    
    var currentPhotoIndex:Int = 0 {
        
        didSet {
            
            pageControl.currentPage = currentPhotoIndex
            
        }
        
    }
    
    // MARK: - Initializers methods
    required init(coder aDecoder: NSCoder) {
        
        // add some dummy data
        images = [ UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!,UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")! ]
        
        super.init(coder: aDecoder)
        
    }
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Update dots of page control to match the amount of images
        pageControl.numberOfPages = images.count
        
    }
    
    override func didReceiveMemoryWarning() {
    
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        // This method is called before viewWillLayoutSubviews and let's us know what the new physical size will be of the view
        println("View will transition to size \(size)")
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        // Update the size of the cell (don't know if this is the right place?)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        
    }
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
    // MARK: - Getter & setter methods
    
    // MARK: - IBActions
    
    // MARK: - Target-Action methods
    
    // MARK: - Notification handler methods
    
    // MARK: - Datasource methods
    // MARK: UICollectionViewDataSource methods
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoCollectionViewCell
        cell.imageView.image = images[indexPath.row]
        
        return cell
        
    }

    // MARK: - Delegate methods
    // MARK: UICollectionViewDelegate methods
    
    // MARK: UIScrollViewDelegate methods
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        // Calculate what the current photo index is so we can calculate the correct offset for the scrollview
        currentPhotoIndex = Int(collectionView.contentOffset.x / collectionView.bounds.size.width);
        
    }

}
