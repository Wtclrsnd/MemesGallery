//
//  APIWorker.swift
//  PicsumGallery
//
//  Created by Emil Shpeklord on 25.02.2022.
//

import Foundation

class APIWorker {
	func getData(request: URLRequest, completion: @escaping ([RandomPhotoResponse]) -> Void) {
		URLSession.shared.dataTask(with: request) { data, _, error in
			guard error == nil else {
				print(String(describing: error?.localizedDescription))
				return
			}
			guard let data = data else {
				return
			}

			print(data)

			let jsonDecoder = JSONDecoder()

			do {
				let responseObject = try jsonDecoder.decode(
					[RandomPhotoResponse].self,
					from: data
				)
				print(responseObject)
				completion(responseObject)
			} catch let error {
				print(String(describing: error.localizedDescription))
			}
		}
		.resume()
	}


}
