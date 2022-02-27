//
//  PhotosModel.swift
//  PicsumGallery
//
//  Created by Emil Shpeklord on 25.02.2022.
//

import Foundation
import UIKit

// MARK: - Meme
struct Meme: Codable {
	var success: Bool?
	var data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
	var memes: [MemeElement]?
}

// MARK: - MemeElement
struct MemeElement: Codable {
	var id: String?
	var name: String?
	var url: String?
	var width: Int?
	var height: Int?
	var boxCount: Int?
}

struct Photo {
	var image: UIImage
	var description: String
}
