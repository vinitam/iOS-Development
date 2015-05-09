//
//  ViewController.swift
//  ScrollViewSwift
//
//  Created by Vinita Miranda on 5/6/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageArray = ["no_alcohol" ,"no_cash"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...count(imageArray) - 1
        {
            var xCordinate : CGFloat = self.view.frame.size.width * CGFloat(i)

            var imageView =  UIImageView(frame: CGRectMake(xCordinate, 0, self.view.frame.size.width, self.view.frame.size.height))
            
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            var image = UIImage(named: imageArray[i])
            imageView.image = image
            self.scrollView.addSubview(imageView)
        }
        
        var contentWidth:CGFloat = self.view.frame.size.width * CGFloat(imageArray.count)
        self.scrollView.contentSize = CGSizeMake(contentWidth, self.view.frame.size.height)
        self.scrollView.pagingEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

