//
//  PhotosViewController.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 27.5.22..
//

import UIKit

struct CollectionView {
    var image: UIImage
    
    static func makeCollectionView() -> [CollectionView] {
        var photos = [CollectionView]()
        
        photos.append(CollectionView(image: UIImage(named: "1")!))
        photos.append(CollectionView(image: UIImage(named: "2")!))
        photos.append(CollectionView(image: UIImage(named: "3")!))
        photos.append(CollectionView(image: UIImage(named: "4")!))
        photos.append(CollectionView(image: UIImage(named: "5")!))
        photos.append(CollectionView(image: UIImage(named: "6")!))
        photos.append(CollectionView(image: UIImage(named: "7")!))
        photos.append(CollectionView(image: UIImage(named: "8")!))
        photos.append(CollectionView(image: UIImage(named: "9")!))
        photos.append(CollectionView(image: UIImage(named: "10")!))
        photos.append(CollectionView(image: UIImage(named: "11")!))
        photos.append(CollectionView(image: UIImage(named: "12")!))
        

        return photos
    }
}

class PhotosViewController: UIViewController {
    
    private var collectionPhotoView = CollectionView.makeCollectionView()
    
    private enum Constants {
        static let itemCount: CGFloat = 3
    }

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()
        
    private lazy var collectionView: UICollectionView = {
            
        let collection = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCollectionCell")
        return collection
    }()
    
    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 4 * spacing
        let itemWidth = floor(neededWidth / Constants.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    lazy var photo: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Фотогалерея"
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func set(image: CollectionView) {
        photo.image = image.image
        
    }
    
    private func setupView() {
        collectionPhotoView = CollectionView.makeCollectionView()
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSorce

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionPhotoView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as? PhotosCollectionViewCell
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            cell.backgroundColor = .black
            return cell
        }
        
        cell.backgroundColor = .systemGray2
        let photo = collectionPhotoView[indexPath.row]
        cell.photoImageView.image = photo.image
        cell.photoImageView.contentMode = .scaleAspectFill
        return cell
    }
}

// MARK: - UICollectionViewDelegate
private var sideInset: CGFloat { return 8 }

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
}

