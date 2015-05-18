//
//  ViewController.swift
//  CameraSwift
//
//  Created by Vinita Miranda on 5/16/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var imagePicker: UIImagePickerController!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func pickFromGalleryClicked(sender: AnyObject) {
        self.imagePicker =  UIImagePickerController()
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = .PhotoLibrary
        presentViewController(self.imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func clickPhoto(sender: UIButton)
    {
        var isCameraAvailable = UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.Front) as Bool

        if(isCameraAvailable)
        {
            self.imagePicker =  UIImagePickerController()
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .Camera
            presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        else
        {
            
            var alertview = UIAlertView(title: "", message: "No Camera Found", delegate: nil, cancelButtonTitle: "OK")
            alertview.show()

        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        self.imagePicker.dismissViewControllerAnimated(true, completion: nil)
        self.imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    

}

