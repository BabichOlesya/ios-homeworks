//
//  PostView.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 23.5.22..
//

import UIKit

struct PostView {
    let author: String
    let image: UIImage
    let description: String
    var likes: Int
    var views: Int
    
    static func makePostView() -> [PostView] {
        var newsLine = [PostView]()
        
        newsLine.append(PostView(author: "Olaf Scholz", image: UIImage(named: "Olaf_Scholz_1984")!, description: "Look! I found an old photo. Am I cute boy?", likes: 794, views: 1036))
        newsLine.append(PostView(author: "Ursula Gertrud von der Leyen", image: UIImage(named: "Ursula")!, description: "My husband caught yesterday while fishing these crucian", likes: 234, views: 765))
        newsLine.append(PostView(author: "Gerhard Fritz Kurt Schröder", image: UIImage(named: "1-format43")!, description: "Look into my honest eyes, how can they lie?", likes: 12, views: 894))
        newsLine.append(PostView(author: "Frank-Walter Steinmeier", image: UIImage(named:"weather")!, description: "Guys, let's go on a picnic, they promise good weather", likes: 11467, views: 12547))
        
        return newsLine
    }
}
