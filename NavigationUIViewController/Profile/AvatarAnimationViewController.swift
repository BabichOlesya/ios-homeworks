//
//  AvatarAnimationViewController.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 28.5.22..
//

import UIKit

class AvatarAnimationViewController: UIViewController {

    lazy var avatarAnimationView: UIImageView = {
        let profileImage = UIImage(named: "angela.merkel")
        let profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.image = profileImage
        return profileImageView
    }()

    lazy var whiteView: UIImageView = {
        let whiteView = UIImageView()
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.clipsToBounds = true
        whiteView.alpha = 0.5
        whiteView.backgroundColor = .black
        return whiteView
    }()

    lazy var closeButton: UIButton = {
        let buttonImage = UIImage(systemName: "xmark.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(buttonImage, for: .normal)
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        return closeButton
    }()

    private let tapGestureRecogniser = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupGesture()
    }

    private func setupView() {

        self.view.backgroundColor = .clear

        self.view.addSubview(self.avatarAnimationView)
        self.view.addSubview(self.whiteView)
        self.view.addSubview(self.closeButton)
        self.view.bringSubviewToFront(self.avatarAnimationView)

        NSLayoutConstraint.activate([

            avatarAnimationView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            avatarAnimationView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            avatarAnimationView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            avatarAnimationView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            avatarAnimationView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0),

            whiteView.topAnchor.constraint(equalTo: self.view.topAnchor),
            whiteView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            whiteView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            whiteView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

            closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10.0),
            closeButton.heightAnchor.constraint(equalToConstant: 60.0),
            closeButton.widthAnchor.constraint(equalToConstant: 60.0)
        ])
    }

    private func setupGesture() {
        self.tapGestureRecogniser.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(self.tapGestureRecogniser)
    }

    @objc func didTapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
}
