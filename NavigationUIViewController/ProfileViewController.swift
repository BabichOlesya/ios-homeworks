//
//  ProfileViewController.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 25.02.2022.
//

import UIKit

class ProfileViewController: UIViewController, ChangeLikesDelegate, ChangeViewsDelegate {
    
    private var postView = PostView.makePostView()
    private var likesCount = 0


    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setStatusBarColor()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setStatusBarColor() {

        let statusbarView = UIView()
        statusbarView.translatesAutoresizingMaskIntoConstraints = false
        statusbarView.backgroundColor = UIColor.systemGray6
        view.addSubview(statusbarView)

        NSLayoutConstraint.activate([
            
        statusbarView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0),
        statusbarView.topAnchor.constraint(equalTo: view.topAnchor),
        statusbarView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func viewsChanged(at indexPath: IndexPath) {
        postView[indexPath.row - 1].views += 1
        tableView.reloadData()
    }

    func likesChanged() {
        likesCount += 1
        tableView.reloadData()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postView.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
            return cell
        }
        cell.likesDelegate = self
        let article = self.postView[indexPath.row - 1]
        let likes = article.likes + likesCount
        self.postView[indexPath.row - 1].likes = likes
        let likeView = CustomTableViewCell.LikeView(author: article.author,
                                                    description: article.description,
                                                    image: article.image,
                                                    likes: likes,
                                                    views: article.views,
                                                    isLiked: article.isLiked,
                                                    isViewed: article.isViewed)
        cell.setup(with: likeView)
        likesCount = 0
        return cell
        }
    }
}


// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        } else {
            let detailVC = DetailViewController()
            detailVC.author = postView[indexPath.row - 1].author
            detailVC.descriptionText = postView[indexPath.row - 1].description
            detailVC.image = postView[indexPath.row - 1].image
            detailVC.likes = postView[indexPath.row - 1].likes
            detailVC.views = postView[indexPath.row - 1].views
            detailVC.isViewed = postView[indexPath.row - 1].isViewed
            if !postView[indexPath.row - 1].isViewed {
                viewsChanged(at: indexPath)
        }
            postView[indexPath.row - 1].isViewed = true
            self.navigationController?.present(detailVC, animated: true)
        }7
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        300
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CustomHeaderView()
        return header
    }
}
