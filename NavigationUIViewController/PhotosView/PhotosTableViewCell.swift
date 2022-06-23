//
//  PhotosTableViewCell.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 27.5.22..
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var whiteView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Фото"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var arrowView: UIImageView = {
        let arrow = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let arrowView = UIImageView()
        arrowView.image = arrow
        arrowView.clipsToBounds = true
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        return arrowView
    }()

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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

     
    private func layout() {
        
        contentView.addSubview(whiteView)
        whiteView.addSubview(titleLabel)
        whiteView.addSubview(arrowView)
        whiteView.addSubview(photoStackView)
        photoStackView.addArrangedSubview(photoTable1)
        photoStackView.addArrangedSubview(photoTable2)
        photoStackView.addArrangedSubview(photoTable3)
        photoStackView.addArrangedSubview(photoTable4)
        
        NSLayoutConstraint.activate([
        
        whiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
        whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

        titleLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 12.0),
        titleLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 12.0),

        arrowView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -12.0),
        arrowView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
        arrowView.heightAnchor.constraint(equalTo: titleLabel.heightAnchor),
        arrowView.widthAnchor.constraint(equalTo: arrowView.heightAnchor, multiplier: 1.0),

        photoStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12.0),
        photoStackView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -12.0),
        photoStackView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 12.0),
        photoStackView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -12.0),

        photoTable1.heightAnchor.constraint(equalTo: photoTable1.widthAnchor, multiplier: 1.0)
        ])
    }
}
