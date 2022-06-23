//
//  FeedViewController.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 25.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let button = UIButton(frame: CGRect(x: 100, y: 550, width: 100, height: 40))
        view.addSubview(button)
        button.setTitle("Перейти к постам", for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 90).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -90).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func clickButton() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
<<<<<<< HEAD
}

struct Post {
    let title: String = "Пост"
}

let myPost = Post()
=======
    
    struct Post {
        let title: String
    }

    var myPost = Post(title: "Пост")
}



>>>>>>> develop-iosui
