//
//  DetailViewController.swift
//  MemeMe
//
//  Created by leanne on 3/11/16.
//  Copyright © 2016 leanne63. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	
	// MARK: - Properties (Non-Outlets)
	
	var selectedMeme: Meme!
	
	
	// MARK: - Properties (Outlets)
	
	@IBOutlet weak var imageView: UIImageView!
	
	
	// MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
		
		imageView.image = selectedMeme.memedImage
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		guard let segueId = segue.identifier else {
			return
		}
		
		switch segueId {
			
		case "detailViewSegueToEditor":
			// segue is to editor's navigation controller; need to reach its child view controller
			let controller = segue.destination as! EditorViewController
			controller.defaultTopText = selectedMeme.topMemeText
			controller.defaultBottomText = selectedMeme.bottomMemeText
			controller.selectedImage = selectedMeme.originalImage
			
			controller.cameFromDetail = true
			
		default:
			print("unknown segue: \(segueId)")
		}
    }
	
}
