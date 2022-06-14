//
//  InfoViewController.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 25.02.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        title = "Информация"
        
        let buttonInfo = UIButton(frame: CGRect(x: 100, y: 550, width: 100, height: 40))
        view.addSubview(buttonInfo)
        buttonInfo.setTitle("Сохранить", for: .normal)
        buttonInfo.backgroundColor = .systemYellow
        buttonInfo.layer.cornerRadius = 12
        buttonInfo.translatesAutoresizingMaskIntoConstraints = false
        buttonInfo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 90).isActive = true
        buttonInfo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -90).isActive = true
        buttonInfo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        buttonInfo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonInfo.addTarget(self, action: #selector(clickButtonInfo), for: .touchUpInside)
    }
    
    @objc func clickButtonInfo() {
        let alert = UIAlertController(title: "Внимание", message: "При сохранении данный пост будет доступен для пользователей сети", preferredStyle: .alert)
        let clickYes = UIAlertAction(title: "Сохранить", style: .default, handler: nil)
        let clickNo = UIAlertAction(title: "Отменить", style: .destructive, handler: nil)
        alert.addAction(clickYes)
        alert.addAction(clickNo)
        present(alert, animated: true, completion: nil)
    }
}
