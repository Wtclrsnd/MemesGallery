//
//  APIWorker.swift
//  PicsumGallery
//
//  Created by Emil Shpeklord on 25.02.2022.
//

import Foundation
import UIKit

final class APIWorker {
	func getData(request: URLRequest, completion: @escaping ([Photo]) -> Void) {
		let queue = DispatchQueue.global(qos: .userInitiated)

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
					var photos: [Photo] = []

					guard let memeArray = responseObject.data?.memes else { return }
					for iPhoto in memeArray {
						let url = URL(string: iPhoto.url ?? "")
						guard let safeUrl = url else { return }
						if let data = try? Data(contentsOf: safeUrl) {
							let image = UIImage(data: data)
							guard let gotImage = image else { return }
							guard let name = iPhoto.name else { return }
							let photo = Photo(image: gotImage, description: name)
							photos.append(photo)
						}
					}
//					print(photos)
					completion(photos)
				} catch let error {
					print(String(describing: error.localizedDescription))
				}
			}
			.resume()
		}
	}
}
