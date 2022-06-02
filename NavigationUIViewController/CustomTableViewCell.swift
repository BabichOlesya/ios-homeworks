//
//  CustomTableViewCell.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 23.5.22..
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    struct LikeView: LikeViewProtocol {
        let author: String
        let description: String
        let image: String
        var likes: Int
        var views: Int
        var isLiked: Bool
        var isViewed: Bool
    }
    
    weak var likesDelegate: ChangeLikesDelegate?
    var likesCount = 0
    var isLiked = false

    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 0
        return view
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(likesLabelClick))
        label.addGestureRecognizer(tapGesture)
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
    
    @objc private func likesLabelClick(){
        self.likesDelegate?.likesChanged()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.authorLabel.text = nil
        self.descriptionLabel.text = nil
        self.postImageView.image = nil
        self.likesLabel.text = nil
        self.viewsLabel.text = nil
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


extension CustomTableViewCell: Setupable {
    func setup(with likeView: LikeViewProtocol) {
        guard let likeView = likeView as? LikeView else { return }
        

        self.authorLabel.text = likeView.author
        self.descriptionLabel.text = likeView.description
        self.postImageView.image = UIImage(named: likeView.image)
        self.likesLabel.text = "Likes: " + String(likeView.likes)
        self.viewsLabel.text = "Views: " + String(likeView.views)
    }
}
