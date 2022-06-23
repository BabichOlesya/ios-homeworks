//
//  Protocols.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 2.6.22..
//

import UIKit

protocol LikeViewProtocol {}

protocol Setupable {
    func setup(with likeView: LikeViewProtocol)
}

protocol ChangeLikesDelegate: AnyObject {
    func likesChanged()
}

protocol ChangeViewsDelegate: AnyObject {
    func viewsChanged(at indexPath: IndexPath)
}
