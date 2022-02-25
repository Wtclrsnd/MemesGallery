//
//  PhotosModel.swift
//  PicsumGallery
//
//  Created by Emil Shpeklord on 25.02.2022.
//

import Foundation
import UIKit

// MARK: - RandomPhotoResponseElement
struct RandomPhotoResponse: Codable {
	var id: String?
	var author: String?
	var width: Int?
	var height: Int?
	var url: String?
	var downloadURL: String?
}

struct Photo {
	var image: UIImage
	var author: String
}
