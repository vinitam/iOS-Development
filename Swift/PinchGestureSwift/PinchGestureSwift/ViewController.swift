//
//  ViewController.swift
//  PinchGestureSwift
//
//  Created by Vinita Miranda on 5/15/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        var pgr = UIPinchGestureRecognizer(target: self, action: "scaleImage:") as UIPinchGestureRecognizer
        pgr.delegate = self
        self.imageView.addGestureRecognizer(pgr)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scaleImage(sender: UIPinchGestureRecognizer) {
        self.imageView.transform = CGAffineTransformScale(self.view.transform, sender.scale, sender.scale)
        sender.scale = 100
    }
}

