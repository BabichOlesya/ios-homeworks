//
//  PhotosCollectionViewCell.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 27.5.22..
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private var startingFrame: CGRect?
    private var buttonClose = UIButton()
    private var backView = UIView(frame: .zero)
    private var zoomingImageView = UIImageView(frame: .zero)
    
    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner
            ]
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    
    private func layout () {
        [whiteView, photoImageView].forEach {
            contentView.addSubview($0)}
            
            NSLayoutConstraint.activate([
                photoImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
                photoImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
                photoImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
                photoImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor)
            ])
        }
}
