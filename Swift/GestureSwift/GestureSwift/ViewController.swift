//
//  ViewController.swift
//  GestureSwift
//
//  Created by Vinita Miranda on 5/15/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {

    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    @IBAction func pinchDetected(sender: UIPinchGestureRecognizer)
    {
        var scale = sender.scale
        var velocity = sender.velocity
        var outputString = "Pinch with velocity \(velocity) detected with a scale of:\(scale)"
        self.statusLabel.text = outputString
    }
    
    
    @IBAction func tapRecogniser(sender: UITapGestureRecognizer)
    {
        self.statusLabel.text = "Single Tap detected"
    }
    
    
    @IBAction func rotationDetector(sender: UIRotationGestureRecognizer)
    {
        let radians = sender.rotation
        let velocity = sender.velocity
        let outputString = "Rotation with velocity \(velocity) detected with a angle of:\(radians)"
        self.statusLabel.text = outputString
    }
    
    @IBAction func swipeDetected(sender: UISwipeGestureRecognizer)
    {
//        self.statusLabel.text = "Right swipe detected"
    }
    
    
    @IBAction func longPressDetected(sender: UILongPressGestureRecognizer)
    {
        self.statusLabel.text = "Long Press detected"
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        return true
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @IBAction func panEdgeGesture(sender: UIScreenEdgePanGestureRecognizer) {
        self.statusLabel.text = "Pan Edge detected"

    }
    
    
    @IBAction func panGestureDetected(sender: UIPanGestureRecognizer) {
        self.statusLabel.text = "Pan detected"

    }
}

