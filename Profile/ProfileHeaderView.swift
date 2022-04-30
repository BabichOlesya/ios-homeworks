//
//  ProfileHeaderView.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 04.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let profileImageView: UIImageView = {
        let profileImage = UIImage(named: "merkel")
        let profileImageView = UIImageView(image: profileImage)
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.layer.cornerRadius = 83.0
        profileImageView.layer.masksToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        return profileImageView
    }()
    
    private let name: UILabel = {
        let name = UILabel()
        name.text = "Angela D.Merkel"
        name.font = .systemFont(ofSize: 18, weight: .bold)
        name.adjustsFontSizeToFitWidth = true
        name.minimumScaleFactor = 0.5
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
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
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let showButton: UIButton = {
        let showButton = UIButton()
        showButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showButton.setTitle("Установить статус", for: .normal)
        showButton.backgroundColor = myColor
        showButton.layer.shadowColor = UIColor.black.cgColor
        showButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showButton.layer.cornerRadius = 4
        showButton.layer.shadowOpacity = 0.7
        showButton.translatesAutoresizingMaskIntoConstraints = false
        return showButton
    }()
    
    private var status: UITextField = {
        let status = UITextField()
        status.backgroundColor = .lightGray
        status.font = .italicSystemFont(ofSize: 20)
        status.textColor = .systemGray4
        status.text = "Статус"
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()

    private lazy var labelStackView: UIStackView = {
        let labelstackView = UIStackView()
        labelstackView.axis = .vertical
        labelstackView.distribution = .fillEqually
        labelstackView.spacing = 15
        labelstackView.translatesAutoresizingMaskIntoConstraints = false
        return labelstackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 45
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func addConstraints() {
        
        self.addSubview(stackView)
        stackView.addArrangedSubview(profileImageView)
        stackView.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(name)
        labelStackView.addArrangedSubview(status)
        labelStackView.addArrangedSubview(textField)
        labelStackView.addArrangedSubview(showButton)

        var constraints = [NSLayoutConstraint]()
        
        constraints.append(stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        constraints.append(stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20))
        constraints.append(stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20))
        constraints.append(stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20))
        constraints.append(stackView.heightAnchor.constraint(equalToConstant: 220))

        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func buttonPressed() {
        status.text = textField.text
        status.textColor = .black
        textField.text = ""
        UIView.animate(withDuration: 1.0) {
            self.textField.alpha = 1
            self.endEditing(true)
            if self.status.hasText {
                self.showButton.setTitle("Изменить статус", for: .normal)
                self.textField.alpha = 0
            }
        }
    }
}

