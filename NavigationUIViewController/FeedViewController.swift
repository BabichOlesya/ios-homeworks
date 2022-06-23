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
        addConstraint()
    }
    
    private lazy var postButton1: UIButton = {
        let postButton1 = UIButton()
        postButton1.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        postButton1.setTitle("Кнопка", for: .normal)
        postButton1.backgroundColor = myColor
        postButton1.layer.cornerRadius = 10
        postButton1.translatesAutoresizingMaskIntoConstraints = false
        return postButton1
    }()
    
    private lazy var postButton2: UIButton = {
        let postButton2 = UIButton()
        postButton2.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        postButton2.setTitle("Еще кнопка", for: .normal)
        postButton2.backgroundColor = myColor
        postButton2.layer.cornerRadius = 10
        postButton2.translatesAutoresizingMaskIntoConstraints = false
        return postButton2
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 10
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        return buttonStackView
    }()
    
    @objc func clickButton() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
<<<<<<< HEAD
    
    private func addConstraint() {
        
        var constraints = [NSLayoutConstraint]()
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(postButton1)
        buttonStackView.addArrangedSubview(postButton2)
        constraints.append(buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(buttonStackView.widthAnchor.constraint(equalToConstant: 150))
        constraints.append(buttonStackView.heightAnchor.constraint(equalToConstant: 90))
        NSLayoutConstraint.activate(constraints)
    }
=======
<<<<<<< HEAD
>>>>>>> origin/develop-iosui
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
