//
//  PhotoCollection.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 2.6.22..
//

import UIKit

struct CollectionView: Equatable {
    var image: String
    init(image: String){
        self.image = image
    }
}
var collectionPhotoView: [CollectionView] = [CollectionView(image: "1"),
                                             CollectionView(image: "2"),
                                             CollectionView(image: "3"),
                                             CollectionView(image: "4"),
                                             CollectionView(image: "5"),
                                             CollectionView(image: "6"),
                                             CollectionView(image: "7"),
                                             CollectionView(image: "8"),
                                             CollectionView(image: "9"),
                                             CollectionView(image: "10"),
                                             CollectionView(image: "11"),
                                             CollectionView(image: "12")]
