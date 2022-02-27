//
//  APIWorker.swift
//  PicsumGallery
//
//  Created by Emil Shpeklord on 25.02.2022.
//

import UIKit

final class APIWorker {
	private var cache = NSCache<NSNumber, AnyObject>()

	private lazy var photos: [Photo] = []

	func getData(request: URLRequest, completion: @escaping ([Photo]) -> Void) {
		let queue = DispatchQueue.global(qos: .userInitiated)

		if cache.object(forKey: 0 as NSNumber) != nil {
			for integer in 0...99 {
				guard let photo = cache.object(forKey: integer as NSNumber) as? Photo else { return }
				photos.append(photo)
			}
			completion(photos)
		} else {
			queue.async {
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
							Meme.self,
							from: data
						)
						//					print(responseObject)

						guard let memeArray = responseObject.data?.memes else { return }
						for integer in 0...99 {
							let url = URL(string: memeArray[integer].url ?? "")
							guard let safeUrl = url else { return }
							if let data = try? Data(contentsOf: safeUrl) {
								let image = UIImage(data: data)
								guard let gotImage = image else { return }
								guard let name = memeArray[integer].name else { return }
								let photo = Photo(image: gotImage, description: name)
								self.photos.append(photo)
								self.cache.setObject(photo as AnyObject, forKey: integer as NSNumber)
							}
						}
						//					print(photos)
						completion(self.photos)
					} catch let error {
						print(String(describing: error.localizedDescription))
					}
				}
				.resume()
			}
		}
	}
}
