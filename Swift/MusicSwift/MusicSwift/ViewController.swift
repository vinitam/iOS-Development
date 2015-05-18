//
//  ViewController.swift
//  MusicSwift
//
//  Created by Vinita Miranda on 5/14/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate {
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playAudio(sender: AnyObject) {
        
            var path =  NSBundle.mainBundle().pathForResource("drum", ofType: "mp3")
            var drumSound = NSURL(fileURLWithPath: path!)

            var error:NSError?
            audioPlayer = AVAudioPlayer(contentsOfURL: drumSound, error: &error)
            audioPlayer.prepareToPlay()
            audioPlayer.delegate = self
            audioPlayer.play()

    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool)
    {
        
    }
    
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer!, error: NSError!)
    {
        
    }
    
    
    @IBAction func stopAudio(sender: AnyObject) {
        audioPlayer.stop()  

    }

    @IBAction func pauseAudio(sender: AnyObject)
    {
        audioPlayer.pause()
    }
}

