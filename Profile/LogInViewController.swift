//
//  LogInViewController.swift
//  NavigationUIViewController
//
//  Created by Олеся Бабич on 30.04.2022.
//

import UIKit

class LoginViewController: UIViewController {

    private let scrollFieldView: UIScrollView = {
        let scrollFieldView = UIScrollView()
        scrollFieldView.translatesAutoresizingMaskIntoConstraints = false
        return scrollFieldView
    } ()
    
    let logoImage: UIImageView = {
        let logo = UIImage(named: "logo")
        let logoImage = UIImageView(image: logo)
        logoImage.layer.cornerRadius = 7
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    } ()
    
    lazy var loginField: UITextField = {
        let loginField = UITextField()
        loginField.placeholder = "Введите логин"
        loginField.adjustsFontSizeToFitWidth = true
        loginField.minimumFontSize = 0.5
        loginField.returnKeyType = .done
        loginField.autocapitalizationType = .words
        loginField.font = .systemFont(ofSize: 15)
        loginField.textColor = .black
        loginField.backgroundColor = .systemGray5
        loginField.borderStyle = .roundedRect
        loginField.returnKeyType = .next
        loginField.keyboardType = .default
        loginField.clearButtonMode = .always
        loginField.translatesAutoresizingMaskIntoConstraints = false
        return loginField
    } ()
    
     lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Введите пароль"
        passwordField.adjustsFontSizeToFitWidth = true
        passwordField.minimumFontSize = 0.5
        passwordField.returnKeyType = .done
        passwordField.autocapitalizationType = .words
        passwordField.font = .systemFont(ofSize: 15)
        passwordField.textColor = .black
        passwordField.backgroundColor = .systemGray5
        passwordField.borderStyle = .roundedRect
        passwordField.returnKeyType = .default
        passwordField.keyboardType = .default
        passwordField.clearButtonMode = .always
        passwordField.isSecureTextEntry = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    } ()
    

    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        loginButton.setTitle("Авторизоваться", for: .normal)
        loginButton.backgroundColor = myColor
        loginButton.layer.cornerRadius = 7
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addConstraint()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func buttonPressed() {
        let profileViewController = ProfileViewController()
        guard let login = loginField.text else {return}
        guard let password = passwordField.text else {return}
        if login.isEmpty && password.isEmpty {
            loginField.trigger()
            passwordField.trigger()
        } else if login.isEmpty {
            loginField.trigger()
        } else if password.isEmpty {
            passwordField.trigger()
                } else {
                    navigationController?.pushViewController(profileViewController, animated: true)
        }
    }
    
    private lazy var fieldStackView: UIStackView = {
        let fieldStackView = UIStackView()
        fieldStackView.axis = .vertical
        fieldStackView.distribution = .fillEqually
        fieldStackView.spacing = 0
        fieldStackView.translatesAutoresizingMaskIntoConstraints = false
        return fieldStackView
    }()
    
    private func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillHideNotification, object: nil)
        addTapGestureToHideKeyboard()
        loginField.delegate = self
        passwordField.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func kbdShow(_ notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            if let kbdSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = kbdSize.cgRectValue
                let keyboardHeight = keyboardRectangle.height
                let contentOffset: CGPoint = notification.name == UIResponder.keyboardWillHideNotification
                ? .zero
                : CGPoint(x: 0, y: keyboardHeight / 2)
                self.scrollFieldView.contentOffset = contentOffset
            }
        }
    }
    
    @objc private func kbdHide(_ notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.scrollFieldView.contentInset.bottom = .zero
            self.scrollFieldView.verticalScrollIndicatorInsets = .zero
        }
    }
    
    private func addConstraint() {
        
        view.addSubview(scrollFieldView)
        scrollFieldView.addSubview(logoImage)
        scrollFieldView.addSubview(fieldStackView)
        scrollFieldView.addSubview(loginButton)
        fieldStackView.addArrangedSubview(loginField)
        fieldStackView.addArrangedSubview(passwordField)

        var constraints = [NSLayoutConstraint]()
        
        constraints.append(scrollFieldView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(scrollFieldView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(scrollFieldView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(scrollFieldView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(scrollFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        
        constraints.append(fieldStackView.topAnchor.constraint(lessThanOrEqualTo: logoImage.bottomAnchor, constant: 60))
        constraints.append(fieldStackView.centerXAnchor.constraint(equalTo: scrollFieldView.centerXAnchor))
        constraints.append(fieldStackView.leadingAnchor.constraint(equalTo: scrollFieldView.leadingAnchor, constant: 20))
        constraints.append(fieldStackView.trailingAnchor.constraint(equalTo: scrollFieldView.trailingAnchor, constant: 20))
        
        let leadingStackConstraint = fieldStackView.leadingAnchor.constraint(equalTo: scrollFieldView.leadingAnchor)
        let trailingStackConstraint = fieldStackView.trailingAnchor.constraint(equalTo: scrollFieldView.trailingAnchor)
        leadingStackConstraint.priority = UILayoutPriority(999)
        trailingStackConstraint.priority = UILayoutPriority(999)
        constraints.append(leadingStackConstraint)
        constraints.append(trailingStackConstraint)
        
        constraints.append(logoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        constraints.append(logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 90))
        constraints.append(logoImage.widthAnchor.constraint(equalToConstant: 100))
        constraints.append(logoImage.heightAnchor.constraint(equalToConstant: 100))
        
        constraints.append(loginButton.topAnchor.constraint(equalTo: self.fieldStackView.bottomAnchor, constant: 20))
        constraints.append(loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        constraints.append(loginButton.leadingAnchor.constraint(equalTo: scrollFieldView.leadingAnchor, constant: 20))
        constraints.append(loginButton.trailingAnchor.constraint(equalTo: scrollFieldView.trailingAnchor, constant: 20))
        constraints.append(loginButton.heightAnchor.constraint(equalToConstant: 40))
        let loginButtonBottomAnchor = loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        loginButtonBottomAnchor.priority = UILayoutPriority(999)
        constraints.append(loginButtonBottomAnchor)

        NSLayoutConstraint.activate(constraints)
        
        for view in fieldStackView.arrangedSubviews {
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 40)
            ])
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordField.resignFirstResponder()
    }
}


