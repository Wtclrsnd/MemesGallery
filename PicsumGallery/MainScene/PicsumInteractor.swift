//
//  PicsumInteractor.swift
//  PicsumGallery
//
//  Created by Emil Shpeklord on 25.02.2022.
//

import Foundation

protocol PicsumPresenterProtocol {

}

class PicsumInteractor: PicsumInteractorProtocol {
	var worker: APIWorker?
	var output: PicsumPresenterProtocol?

	init(_ worker: APIWorker) {
		self.worker = worker
	}

	func getData(completion: @escaping (([RandomPhotoResponse]) -> Void)) {
		let urlString = "https://picsum.photos/v2/list?limit=100"
		guard let url = URL(string: urlString) else { return }
		let request = URLRequest(url: url)
		worker?.getData(request: request, completion: { responseObject in
			
		})
	}
}
