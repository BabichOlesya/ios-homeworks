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
    
    private lazy var invalidLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 5
        label.contentMode = .scaleToFill
        label.textAlignment = .center
        label.isHidden = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addConstraint()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    private lazy var validationData = ValidationData()

    private func validEmail(login: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validEmail = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return validEmail.evaluate(with: login)
    }

    private func validPassword(password : String) -> Bool {
        let passwordReg =  ("(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[@#$%^&*]).{8,}")
        let passwordTesting = NSPredicate(format: "SELF MATCHES %@", passwordReg)
        return passwordTesting.evaluate(with: password) && password.count > 6
    }

    @objc func buttonPressed() {
        let profileViewController = ProfileViewController()
        guard let login = loginField.text else {return}
        guard let password = passwordField.text else {return}
        let enteredLogin = validEmail(login: login)
        let enteredPassword = validPassword(password: password)
        if login.isEmpty && password.isEmpty {
            loginField.trigger()
            passwordField.trigger()
        } else if login.isEmpty {
            loginField.trigger()
        } else if password.isEmpty {
            passwordField.trigger()
        } else {
            if !enteredPassword && !enteredLogin {
                invalidLabel.text = validationData.invalidEmailAndPassword
                invalidLabel.isHidden = false
                passwordField.trigger()
                loginField.trigger()
            } else if !enteredPassword {
                invalidLabel.text = validationData.invalidPassword
                invalidLabel.isHidden = false
                passwordField.trigger()
            } else if !enteredLogin {
                invalidLabel.text = validationData.invalidEmail
                invalidLabel.isHidden = false
                loginField.trigger()
            } else {
                if (enteredLogin && enteredPassword) && (loginField.text != validationData.defaultLogin || passwordField.text != validationData.defaultPassword) {
                    let alert = UIAlertController(title: "Неверный логин или пароль", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
                } else {
                    navigationController?.pushViewController(profileViewController, animated: true)
                    invalidLabel.isHidden = true
                }
            }
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
        scrollFieldView.addSubview(invalidLabel)
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
        
        constraints.append(invalidLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 5))
        constraints.append(invalidLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        constraints.append(invalidLabel.widthAnchor.constraint(equalToConstant: 200))
        
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
