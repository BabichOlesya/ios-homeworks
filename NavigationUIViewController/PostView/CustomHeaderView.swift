//
//  CustomHeaderView.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 23.5.22..
//

import UIKit

class CustomHeaderView: UIView {
    
    
    private let profileHeaderView: UIView = {
        let profileHearderView = ProfileHeaderView()
        profileHearderView.translatesAutoresizingMaskIntoConstraints = false
        profileHearderView.backgroundColor = .white
        return profileHearderView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        addSubview(profileHeaderView)
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            profileHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            profileHeaderView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            profileHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset)
        ])
    }

}
