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
        titlePost.text = myPost.title
        self.title = myPost.title
        navigationItem.titleView = titlePost
        view.backgroundColor = .systemPink
        let imageForInfo = UIImage(systemName: "highlighter")
        let buttonPost = UIBarButtonItem(image: imageForInfo , style: .done, target: self, action: #selector(clickButtonPost))
        navigationItem.rightBarButtonItem = buttonPost
    }

    @objc func clickButtonPost() {
        let infoViewController = InfoViewController()
        navigationController?.pushViewController(infoViewController, animated: true)
    }
}
