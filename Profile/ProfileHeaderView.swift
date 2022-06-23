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
<<<<<<< HEAD
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.layer.cornerRadius = 83.0
        profileImageView.layer.masksToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        return profileImageView
    }()
    
    private let name: UILabel = {
        let name = UILabel()
=======
        profileImageView.frame = CGRect(x: 16, y: 120, width: 170, height: 170)
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.backgroundColor = .white
        profileImageView.layer.cornerRadius = 83.0
        profileImageView.layer.masksToBounds = true
        self.addSubview(profileImageView)


        let name = UILabel(frame: CGRect(x: 200, y: 120, width: 200, height: 80))
>>>>>>> origin/develop-iosui
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
        textField.borderStyle = .none
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        textField.layer.cornerRadius = 7
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let showButton: UIButton = {
        let showButton = UIButton()
        showButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showButton.setTitle("Установить статус", for: .normal)
        showButton.backgroundColor = myColor
        showButton.layer.shadowColor = UIColor.black.cgColor
        showButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        showButton.layer.cornerRadius = 4
        showButton.layer.shadowOpacity = 0.7
<<<<<<< HEAD
        showButton.translatesAutoresizingMaskIntoConstraints = false
        return showButton
    }()
    
    private var status: UITextField = {
        let status = UITextField()
<<<<<<< HEAD
        status.backgroundColor = .white
=======
<<<<<<< HEAD
        status.backgroundColor = .white
=======
=======
        self.addSubview(showButton)

>>>>>>> origin/develop-iosui
        status.backgroundColor = .lightGray
>>>>>>> origin/develop-iosui
>>>>>>> origin/develop-iosui
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
        labelstackView.spacing = 8
        labelstackView.translatesAutoresizingMaskIntoConstraints = false
        return labelstackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
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
        self.addSubview(showButton)
        stackView.addArrangedSubview(profileImageView)
        stackView.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(name)
        labelStackView.addArrangedSubview(status)
        labelStackView.addArrangedSubview(textField)
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        constraints.append(stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10))
        constraints.append(stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20))
        constraints.append(stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35))
        constraints.append(stackView.heightAnchor.constraint(equalToConstant: 180))
        
        constraints.append(showButton.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        constraints.append(showButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20))
        constraints.append(showButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20))
        constraints.append(showButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35))
        constraints.append(showButton.heightAnchor.constraint(equalToConstant: 40))

        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func buttonPressed() {
        guard let status = textField.text else {return}
        if !status.isEmpty {
            UIView.animate(withDuration: 0.3) {
                self.status.text = self.textField.text
                self.textField.text = .none
            } completion: { _ in
            }
        }
        if status.isEmpty {
            textField.trigger()
        }
        endEditing(true)
    }
}

