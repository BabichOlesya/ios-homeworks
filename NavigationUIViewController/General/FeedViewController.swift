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
    
    private func addConstraint() {
        
        var constraints = [NSLayoutConstraint]()
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(postButton1)
        buttonStackView.addArrangedSubview(postButton2)
        constraints.append(buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30))
        constraints.append(buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30))
        constraints.append(buttonStackView.heightAnchor.constraint(equalToConstant: 90))
        NSLayoutConstraint.activate(constraints)
    }
}

struct PostView {
    let author: String
    let image: String
    let description: String
    var likes: Int
    var views: Int
    var isLiked: Bool
    var isViewed: Bool
    
    static func makePostView() -> [PostView] {
        var newsLine = [PostView]()
        
        newsLine.append(PostView(author: "Olaf Scholz", image: "Olaf_Scholz_1984", description: "Look! I found an old photo. Am I cute boy?", likes: 794, views: 1036, isLiked: false, isViewed: false))
        newsLine.append(PostView(author: "Ursula Gertrud von der Leyen", image: "Ursula", description: "My husband caught yesterday while fishing these crucian", likes: 234, views: 765, isLiked: false, isViewed: false))
        newsLine.append(PostView(author: "Gerhard Fritz Kurt Schröder", image: "1-format43", description: "Look into my honest eyes, how can they lie?", likes: 12, views: 894, isLiked: false, isViewed: false))
        newsLine.append(PostView(author: "Frank-Walter Steinmeier", image: "weather", description: "Guys, let's go on a picnic, they promise good weather", likes: 11467, views: 12547, isLiked: false, isViewed: false))
        
        return newsLine
    }
}
