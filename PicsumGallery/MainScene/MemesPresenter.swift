//
//  PicsumPresenter.swift
//  PicsumGallery
//
//  Created by Emil Shpeklord on 25.02.2022.
//

import Foundation

protocol MemesViewControllerProtocol: AnyObject {
	func getData(photos: [Photo])
}

class MemesPresenter: PicsumPresenterProtocol {
	weak var output: MemesViewControllerProtocol?

	func getData(photos: [Photo]) {
		output?.getData(photos: photos)
	}

}
