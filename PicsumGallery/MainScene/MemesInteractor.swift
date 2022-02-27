//
//  PicsumInteractor.swift
//  PicsumGallery
//
//  Created by Emil Shpeklord on 25.02.2022.
//

import Foundation

protocol PicsumPresenterProtocol: AnyObject {
	func getData(photos: [Photo])
}

class PicsumInteractor: MemesInteractorProtocol {
	var worker: APIWorker?
	var output: PicsumPresenterProtocol?

	init(_ worker: APIWorker) {
		self.worker = worker
	}

	func getData() {
		let urlString = "https://api.imgflip.com/get_memes"
		guard let url = URL(string: urlString) else { return }
		let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 10)
		worker?.getData(request: request, completion: { photos in
			self.output?.getData(photos: photos)
		})
	}
}
