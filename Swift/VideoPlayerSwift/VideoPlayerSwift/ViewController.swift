//
//  ViewController.swift
//  VideoPlayerSwift
//
//  Created by Vinita Miranda on 5/16/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    var moviePlayer : MPMoviePlayerController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playVideo(sender: AnyObject) {
        let path = NSBundle.mainBundle().pathForResource("lego", ofType:"mp4")
        let url = NSURL.fileURLWithPath(path!)
        moviePlayer = MPMoviePlayerController(contentURL: url)
        if let player = moviePlayer {
            player.view.frame = self.view.bounds
            player.prepareToPlay()
            player.scalingMode = .AspectFill
            self.view.addSubview(player.view)
        }
        
    }

}

