//
//  ProfileViewController.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 25.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
<<<<<<< HEAD
    
    private let profileHeaderView: UIView = {
        let profileHearderView = ProfileHeaderView()
        profileHearderView.translatesAutoresizingMaskIntoConstraints = false
        profileHearderView.backgroundColor = .lightGray
        return profileHearderView
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view.addSubview(profileHeaderView)
        addConstraints()
    }
    
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(profileHeaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        constraints.append(profileHeaderView.topAnchor.constraint(equalTo: view.topAnchor))
        NSLayoutConstraint.activate(constraints)
=======

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
>>>>>>> develop-iosui
    }
}
