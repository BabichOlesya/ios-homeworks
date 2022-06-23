//
//  ProfileHeaderView.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 04.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    let textField = UITextField(frame: CGRect(x: 200, y: 290, width: 160, height: 50))
    let showButton = UIButton(frame: CGRect(x: 200, y: 290, width: 160, height: 50))
    let status = UITextView(frame: CGRect(x: 200, y: 210, width: 160, height: 50))
    
    private func setupView() {
        
        let profileImage = UIImage(named: "merkel")
        let profileImageView = UIImageView(image: profileImage)
        profileImageView.frame = CGRect(x: 16, y: 120, width: 170, height: 170)
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.backgroundColor = .white
        profileImageView.layer.cornerRadius = 83.0
        profileImageView.layer.masksToBounds = true
        self.addSubview(profileImageView)


        let name = UILabel(frame: CGRect(x: 200, y: 120, width: 200, height: 80))
        name.text = "Angela D.Merkel"
        name.font = .systemFont(ofSize: 18, weight: .bold)
        name.adjustsFontSizeToFitWidth = true
        name.minimumScaleFactor = 0.5
        self.addSubview(name)

        textField.placeholder = "Введите статус"
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 0.5
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.font = .systemFont(ofSize: 15)
        textField.textColor = .black
        textField.backgroundColor = .systemGray4
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        textField.alpha = 0
        self.addSubview(textField)

        showButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showButton.setTitle("Установить статус", for: .normal)
        showButton.backgroundColor = .systemBlue
        showButton.layer.shadowColor = UIColor.black.cgColor
        showButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showButton.layer.cornerRadius = 4
        showButton.layer.shadowOpacity = 0.7
        self.addSubview(showButton)

        status.backgroundColor = .lightGray
        status.font = .italicSystemFont(ofSize: 20)
        status.textColor = .systemGray4
        status.text = "Статус"
        self.addSubview(status)
    }

    @objc func buttonPressed() {
        status.text = textField.text
        status.textColor = .black
        textField.text = ""
        UIView.animate(withDuration: 1.0) {
            self.showButton.frame = CGRect(x: 200, y: 370, width: 160, height: 50)
            self.textField.alpha = 1
            self.endEditing(true)
            if self.status.hasText {
                self.showButton.setTitle("Изменить статус", for: .normal)
                self.textField.alpha = 0
                self.showButton.frame = CGRect(x: 200, y: 290, width: 160, height: 50)
            }
        }
    }
    @objc func tap(_ sender: Any) {
        textField.resignFirstResponder()
    }
}
