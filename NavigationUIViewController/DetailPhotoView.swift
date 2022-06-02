//
//  DetailPhotoView.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 2.6.22..
//

import UIKit

class DetailPhotoView: UIView {

    lazy var collectionImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    lazy var closeButton: UIButton = {
        let buttonImage = UIImage(systemName: "xmark.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(buttonImage, for: .normal)
        closeButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return closeButton
    }()

    func setDetailImage(image: String) {
        collectionImage.image = UIImage(named: image)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.backgroundColor = .white
        self.alpha = 0
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupView() {
        self.addSubview(collectionImage)
        self.addSubview(closeButton)

        NSLayoutConstraint.activate([
            self.collectionImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.collectionImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.collectionImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

            self.closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0)
        ])
    }

    @objc private func buttonPressed() {
        UIView.animate(withDuration: 0.5) {
            self.alpha = 0
        }
    }
}
