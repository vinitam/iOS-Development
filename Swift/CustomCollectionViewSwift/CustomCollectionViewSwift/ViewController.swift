//
//  ViewController.swift
//  CollectionViewDefaultSwift
//
//  Created by Vinita Miranda on 5/8/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource
{
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
    super.viewDidLoad()
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell : CustomCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomCollectionViewCell", forIndexPath: indexPath) as! CustomCollectionViewCell
        cell.titleLabel!.text = ("Index: \(indexPath.row)")
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("Index: \(indexPath.row)")
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if(indexPath.item == 0)
        {
            return CGSizeMake((self.view.frame.size.width - 10)/4, 250);
        }
        
        return CGSizeMake((self.view.frame.size.width - 10)/2,100)
        
        
    }
    
}
