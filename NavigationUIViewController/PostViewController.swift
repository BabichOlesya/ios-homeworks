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
<<<<<<< HEAD

        let titlePost = UILabel()
        titlePost.text = myPost.title
        self.title = myPost.title
=======
        
        let vc = FeedViewController()

        let titlePost = UILabel()
        titlePost.text = vc.myPost.title
        self.title = vc.myPost.title
>>>>>>> develop-iosui
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
