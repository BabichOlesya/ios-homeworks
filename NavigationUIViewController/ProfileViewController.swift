//
//  ProfileViewController.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 25.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
<<<<<<< HEAD
    
    private let postView = PostView.makePostView()
    
    private let profileHeaderView: UIView = {
        let profileHearderView = ProfileHeaderView()
        profileHearderView.translatesAutoresizingMaskIntoConstraints = false
        profileHearderView.backgroundColor = .white
        return profileHearderView
    } ()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.backgroundColor = .systemGray2
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addConstraints()
    }
    
    private func addConstraints() {
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(profileHeaderView)
        stackView.addArrangedSubview(tableView)
        
        var constraints = [NSLayoutConstraint]()

        constraints.append(stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        constraints.append(stackView.topAnchor.constraint(equalTo: view.topAnchor))

        constraints.append(profileHeaderView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor))
        constraints.append(profileHeaderView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor))
        constraints.append(profileHeaderView.topAnchor.constraint(equalTo:  stackView.topAnchor))
        constraints.append(profileHeaderView.heightAnchor.constraint(equalToConstant: 300))

        constraints.append(tableView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor))
        constraints.append(tableView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor))
        constraints.append(tableView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor))

        NSLayoutConstraint.activate(constraints)
=======

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
>>>>>>> develop-iosui
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postView.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.setupCell(postView[indexPath.row])
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.setupVC(post: postView[indexPath.row])
        present(detailVC, animated: true)
    }
}

 
