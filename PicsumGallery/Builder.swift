//
//  Builder.swift
//  PicsumGallery
//
//  Created by Emil Shpeklord on 25.02.2022.
//

import Foundation
import UIKit

final class Builder {

	private let APIWorker: APIWorker

	func make() -> UINavigationController {
		let viewController = PicsumViewController()
		let interactor = PicsumInteractor(APIWorker)
		let presenter = PicsumPresenter()
		viewController.output = interactor
		interactor.output = presenter
		presenter.output = viewController

		let nav = UINavigationController(rootViewController: viewController)
		return nav
	}

	init(_ worker: APIWorker) {
		self.APIWorker = worker
	}
}
