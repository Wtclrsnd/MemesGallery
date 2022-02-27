//
//  DetailMemeViewController.swift
//  PicsumGallery
//
//  Created by Emil Shpeklord on 27.02.2022.
//

import UIKit

final class DetailMemeViewController: UIViewController {
	lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()

	lazy var nameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "text"
		label.font = .boldSystemFont(ofSize: 20)
		label.lineBreakMode = .byWordWrapping
		label.textAlignment = .center
		label.numberOfLines = 0
		return label
	}()

	private lazy var mainStack: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .fillProportionally
		stack.spacing = 15
		return stack
	}()

    override func viewDidLoad() {
        super.viewDidLoad()

		if #available(iOS 13.0, *) {
			view.backgroundColor = .systemBackground
		} else {
			view.backgroundColor = .white
		}

		setUpUI()
    }

	private func setUpUI() {
		view.addSubview(mainStack)
		mainStack.addArrangedSubview(imageView)
		mainStack.addArrangedSubview(nameLabel)

		mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
		mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
		mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
		mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
	}
}
