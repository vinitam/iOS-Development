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

    @IBOutlet weak var playerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "orientationChanged:", name: UIDeviceOrientationDidChangeNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playVideo(sender: AnyObject) {
        
        if(self.moviePlayer?.playbackState == MPMoviePlaybackState.Paused)
        {
            self.moviePlayer?.play()
        }
        else
        {
            let path = NSBundle.mainBundle().pathForResource("lego", ofType:"mp4")
            let url = NSURL.fileURLWithPath(path!)
            self.moviePlayer = MPMoviePlayerController(contentURL: url)
            if let player = self.moviePlayer
            {
                player.view.frame = CGRectMake(0, 0, self.playerView.frame.size.width, self.playerView.frame.size.height)
                player.prepareToPlay()
                player.scalingMode = .AspectFill
                self.playerView.addSubview(player.view)
            }
        }
        
    }

    @IBAction func stopVideo(sender: AnyObject)
    {
        if(self.moviePlayer?.playbackState == MPMoviePlaybackState.Playing )
        {
            self.moviePlayer?.stop()
        }
    }
    
    @IBAction func pauseVideo(sender: AnyObject) {
        if(self.moviePlayer?.playbackState == MPMoviePlaybackState.Playing )
        {
            self.moviePlayer?.pause()
        }
    }
    
    func orientationChanged(notification :NSNotification)
    {
        self.adjustViewsForOrientation(UIApplication.sharedApplication().statusBarOrientation)
    }
    
    func adjustViewsForOrientation(orientation : UIInterfaceOrientation)
    {
        
        if (UIInterfaceOrientationIsPortrait(orientation))
        {
            self.moviePlayer?.setFullscreen(false, animated: true)
        }
        else if (UIInterfaceOrientationIsLandscape(orientation))
        {
            self.moviePlayer?.setFullscreen(true, animated: true)
        }
    }
    
}

