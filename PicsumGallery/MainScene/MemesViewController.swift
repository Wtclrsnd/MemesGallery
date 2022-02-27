//
//  ViewController.swift
//  PicsumGallery
//
//  Created by Emil Shpeklord on 25.02.2022.
//

import UIKit

protocol MemesInteractorProtocol: AnyObject {
	func getData()
}

class MemesViewController: UIViewController, MemesViewControllerProtocol {
	var memes: [Photo] = [] {
		didSet {
			DispatchQueue.main.async {
				self.collectionView.reloadData()
			}
		}
	}
	var output: MemesInteractorProtocol?
	private let reusableIdentifier = "myCell"

	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		let width = UIScreen.main.bounds.width
		layout.sectionInset = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
		layout.itemSize = CGSize(width: (width - 60) / 2, height: width / 2)
		layout.minimumInteritemSpacing = 10
		layout.minimumLineSpacing = 50

		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(MemeCollectionViewCell.self, forCellWithReuseIdentifier: reusableIdentifier)

		return collectionView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		setUpUI()
		output?.getData()
	}

	private func setUpUI() {
		view.addSubview(collectionView)
		collectionView.frame = view.bounds
		navigationController?.navigationBar.tintColor = .systemPink
		title = "Memes"
		navigationController?.navigationBar.prefersLargeTitles = true
	}

	func getData(photos: [Photo]) {
		memes = photos
	}
}

extension MemesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return memes.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: reusableIdentifier,
			for: indexPath) as? MemeCollectionViewCell else { return UICollectionViewCell() }
		cell.backgroundColor = .clear
		cell.photoImageView.image = memes[indexPath.row].image
		return cell
	}
}
