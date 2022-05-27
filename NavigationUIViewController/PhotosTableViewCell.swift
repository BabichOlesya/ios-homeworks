//
//  PhotosTableViewCell.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 27.5.22..
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let collectionPhotoView = CollectionView.makeCollectionView()
    
    
    private lazy var photoTable1: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private lazy var photoTable2: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "2"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private lazy var photoTable3: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "3"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private lazy var photoTable4: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "4"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private lazy var photoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Фото"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let transitionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell (_ photo: CollectionView) {
        photoTable1.image = photo.image
        photoTable2.image = photo.image
        photoTable3.image = photo.image
        photoTable4.image = photo.image
    }
     
    private func layout() {
        
        var constraints = [NSLayoutConstraint]()
        
        contentView.addSubview(photoStackView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(transitionButton)
        photoStackView.addArrangedSubview(photoTable1)
        photoStackView.addArrangedSubview(photoTable2)
        photoStackView.addArrangedSubview(photoTable3)
        photoStackView.addArrangedSubview(photoTable4)
        
        constraints.append(titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12))
        constraints.append(titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12))
        
        constraints.append(photoStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12))
        constraints.append(photoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12))
        constraints.append(photoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12))
        constraints.append(photoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12))
        constraints.append(photoStackView.heightAnchor.constraint(equalTo: photoTable1.widthAnchor, multiplier: 1))
        
        constraints.append(transitionButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12))
        constraints.append(transitionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12))
        constraints.append(transitionButton.heightAnchor.constraint(equalToConstant: 15))
//        constraints.append(transitionButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor))
        
        for views in photoStackView.arrangedSubviews {
            constraints.append(views.heightAnchor.constraint(equalToConstant: 70))
            constraints.append(views.widthAnchor.constraint(lessThanOrEqualToConstant: 70))
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    

}
