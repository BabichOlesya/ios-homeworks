//
//  CustomTableViewCell.swift
//  NavigationUIViewController
//
<<<<<<< HEAD
//  Created by Олеся Бабич on 23.5.22..
=======
//  Created by Олеся Бабич on 20.5.22..
>>>>>>> origin/develop-iosui
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
//        label.backgroundColor = .systemGray4
        label.text = "authorLabel"
        return label
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 0
        label.text = "descriptionLabel"
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray6
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 0
        label.text = "likesLabel"
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray6
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 0
        label.text = "viewsLabel"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        customizeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ post: PostView) {
     
        authorLabel.text = post.author
        postImageView.image = post.image
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }
    
    
    private func customizeCell() {
        whiteView.layer.borderColor = UIColor.systemGray.cgColor
    }
    
    private func layout () {
        [whiteView, authorLabel, postImageView, descriptionLabel, likesLabel, viewsLabel].forEach {
            contentView.addSubview($0)}
            
            let viewInset: CGFloat = 8
            let inset: CGFloat = 10
            
            NSLayoutConstraint.activate([
                whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewInset),
                whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
                whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
                whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset)
            ])
            
            NSLayoutConstraint.activate([
                authorLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
                authorLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
                authorLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
                authorLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
            
            NSLayoutConstraint.activate([
                postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
                postImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
                postImageView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
                postImageView.heightAnchor.constraint(equalToConstant: 300)
            ])
        
            NSLayoutConstraint.activate([
                descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: inset),
                descriptionLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
                descriptionLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
                descriptionLabel.heightAnchor.constraint(equalToConstant: 40)
            ])

            NSLayoutConstraint.activate([
                likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
                likesLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
                likesLabel.widthAnchor.constraint(equalToConstant: 90),
                likesLabel.heightAnchor.constraint(equalToConstant: 15),
                likesLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -inset)
            ])

            NSLayoutConstraint.activate([
                viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
                viewsLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
                viewsLabel.widthAnchor.constraint(equalToConstant: 90),
                viewsLabel.heightAnchor.constraint(equalToConstant: 15),
                viewsLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -inset)
            ])
        }
    
}
