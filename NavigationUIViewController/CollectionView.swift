//
//  CollectionView.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 28.5.22..
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
