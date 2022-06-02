//
//  DetailViewController.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 23.5.22..
//

import UIKit

class DetailViewController: UIViewController {
    var author: String?
    var descriptionText: String?
    var image: String?
    var likes: Int?
    var views: Int?
    var index: IndexPath?
    var isViewed: Bool?

    private var viewsCount = 0

    weak var viewsDelegate: ChangeViewsDelegate?

    private func updateViews() {
        if var views = views {
            if let viewed = isViewed {
                if !viewed {
                    views += 1
                    viewsCount = views
                } else {
                    viewsCount = views
                }
            }
        }
    }

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    private lazy var authorLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.backgroundColor = .clear
        $0.numberOfLines = 2
        $0.textColor = .black
        $0.text = author
        $0.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        $0.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        return $0
    }(UILabel())
    
    private lazy var postImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .black
        if let image = image {
            $0.image = UIImage(named: image)
        }
        return $0
    }(UIImageView())
    
    private lazy var textLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 16, weight: .light)
        $0.numberOfLines = 0
        $0.textColor = .systemGray
        $0.text = descriptionText
        $0.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        return $0
    }(UILabel())
    
    private lazy var likesLabel: UILabel = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        updateViews()
        $0.backgroundColor = .systemGray6
        $0.font = .systemFont(ofSize: 14, weight: .light)
        $0.numberOfLines = 0
        if let likes = likes {
            $0.text = "Likes: \(likes)"
        }
        $0.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        return $0
    }(UILabel())
    
    private lazy var viewsLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemGray6
        $0.font = .systemFont(ofSize: 14, weight: .light)
        $0.numberOfLines = 0
        $0.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        $0.text = "Views: \(viewsCount)"
        return $0
    }(UILabel())

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white
        
        guard let index = index else {return}
        guard let viewed = isViewed else {return}
        if !viewed {
            self.viewsDelegate?.viewsChanged(at: index)
        }
    }
    
    private func layout() {
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        [authorLabel, postImageView, textLabel, likesLabel, viewsLabel].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            likesLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.widthAnchor.constraint(equalToConstant: 90),
            likesLabel.heightAnchor.constraint(equalToConstant: 15),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            viewsLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.widthAnchor.constraint(equalToConstant: 90),
            viewsLabel.heightAnchor.constraint(equalToConstant: 15),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])

    }
}

    


