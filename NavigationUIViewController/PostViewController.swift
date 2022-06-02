//
//  PostViewController.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 25.02.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let titlePost = UILabel()
        titlePost.text = "Пост"
        titlePost.font = UIFont.systemFont(ofSize: 20)
        view.backgroundColor = .systemPink
        navigationItem.titleView = titlePost
        let imageForInfo = UIImage(systemName: "highlighter")
        let buttonPost = UIBarButtonItem(image: imageForInfo , style: .done, target: self, action: #selector(clickButtonPost))
        navigationItem.rightBarButtonItem = buttonPost
    }

    @objc func clickButtonPost() {
        let infoViewController = InfoViewController()
        navigationController?.pushViewController(infoViewController, animated: true)
    }
}
