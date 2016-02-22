//
//  MemeMeViewController.swift
//  MemeMe_v1.0
//
//  Created by leanne on 2/21/16.
//  Copyright © 2016 leanne63. All rights reserved.
//

import UIKit

class MemeMeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

	// MARK: - Outlets
	
	@IBOutlet weak var memeImage: UIImageView!
	@IBOutlet weak var albumButton: UIBarButtonItem!
	@IBOutlet weak var cameraButton: UIBarButtonItem!
	@IBOutlet weak var topLabel: UITextField!
	@IBOutlet weak var bottomLabel: UITextField!
	
	
	// MARK: - View Controller Overrides
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		topLabel.text = "TOP"
		topLabel.textAlignment = .Center
		
		bottomLabel.text = "BOTTOM"
		bottomLabel.textAlignment = .Center

	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		albumButton.enabled = UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary)
		cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(.Camera)
	}

	
	// MARK: - Actions
	
	@IBAction func pickAMemeImage(sender: UIBarButtonItem) {
		let imagePickerController = UIImagePickerController()
		imagePickerController.delegate = self
		
		var sourceType: UIImagePickerControllerSourceType?
		
		switch sender {
			
		case albumButton:
			sourceType = .PhotoLibrary
			
		case cameraButton:
			sourceType = .Camera
			
		default:
			print("invalid sender")
			return
		}
		
		imagePickerController.sourceType = sourceType!
		
		presentViewController(imagePickerController, animated: true, completion: nil)
	}
	
	
	// MARK: - Image Picker Delegate Methods
	
	func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
		memeImage.image = image
		
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(picker: UIImagePickerController) {
		dismissViewControllerAnimated(true, completion: nil)
	}

}
