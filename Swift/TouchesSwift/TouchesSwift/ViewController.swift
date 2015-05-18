//
//  ViewController.swift
//  TouchesSwift
//
//  Created by Vinita Miranda on 5/15/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colouredView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        print("touches began")
    }

    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        print("touches moved")
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        print("touches end")
        let touch = touches.first as! UITouch
        let point = touch.locationInView(self.view)
        print("x: \(point.x), y: \(point.y)")

    }
}

