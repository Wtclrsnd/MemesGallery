//
//  ViewController.swift
//  PicsumGallery
//
//  Created by Emil Shpeklord on 25.02.2022.
//

import UIKit

protocol PicsumInteractorProtocol {
	func getData(completion: @escaping ([RandomPhotoResponse]) -> Void) 
}

class PicsumViewController: UIViewController, PicsumViewControllerProtocol {
	var output: PicsumInteractorProtocol?

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .orange
		output?.getData(completion: { photos in
			
		})
	}
}
