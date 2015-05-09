//
//  DetailedViewController.swift
//  ProtocolSampleSwift
//
//  Created by Vinita Miranda on 5/9/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit


protocol DetailedDelegate
{
    func animationDidComplete(detailedViewController : DetailedViewController);
}


class DetailedViewController: UIViewController{
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    var delegate:DetailedDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool)
    {
        self.animateImageOffset()
    }
    
    func animateImageOffset()
    {
        
        UIView.animateWithDuration(3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.topConstraint.constant = 300
            self.imageView.image = UIImage(named: "2.png")
            
            self.imageView.layoutIfNeeded()
            }, completion: {_ in
                self.delegate?.animationDidComplete(self)
                self.navigationController?.popViewControllerAnimated(true)
        })
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
