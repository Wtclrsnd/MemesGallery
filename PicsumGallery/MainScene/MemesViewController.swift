//
//  ViewController.swift
//  PicsumGallery
//
//  Created by Emil Shpeklord on 25.02.2022.
//

import UIKit

protocol MemesInteractorProtocol {
	func getData(completion: @escaping ([Photo]) -> Void) 
}

class MemesViewController: UIViewController, MemesViewControllerProtocol {
	var output: MemesInteractorProtocol?

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .orange
		output?.getData(completion: { photos in
			
		})
	}
}
