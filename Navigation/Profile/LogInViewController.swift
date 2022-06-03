//
//  LogInViewController.swift
//  Navigation
//
//  Created by Mac on 01.06.2022.
//

import Foundation
import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    private let logInView: UIView = {
            let view = UIView()
            view.backgroundColor = .white
        return view
       }()
    private let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            return scrollView
        }()
       let logoView: UIImageView = {
           let view = UIImageView()
           view.image = UIImage(named: "Image")
           view.layer.masksToBounds = true
           return view
       }()
       lazy var loginTextField: UITextField = {
           let text = UITextField()
           text.backgroundColor = .systemGray6
           text.font = UIFont.systemFont(ofSize: 16)
           text.layer.borderColor = UIColor.lightGray.cgColor
           text.layer.cornerRadius = 10
           text.layer.borderWidth = 0.5
           text.placeholder = "Email or phone"
           text.textAlignment = .left
           text.clearButtonMode = .whileEditing
           text.textColor = .black
           text.autocapitalizationType = .none
           text.delegate = self
           return text
       }()
       lazy var passwordTextField: UITextField = {
           let text = UITextField()
           text.backgroundColor = .systemGray6
           text.font = UIFont.systemFont(ofSize: 16)
           text.layer.cornerRadius = 10
           text.layer.borderColor = UIColor.lightGray.cgColor
           text.layer.borderWidth = 0.5
           text.placeholder = "Passowrd"
           text.textAlignment = .left
           text.textColor = .black
           text.isSecureTextEntry = true
           text.autocapitalizationType = .none
           text.delegate = self
           return text
       }()
       lazy var loginBlueButton: UIButton = {
           let button = UIButton()
           button.addTarget(self, action: #selector(toProfile), for: .touchUpInside)
           button.backgroundColor = .systemBlue
           button.titleLabel?.textColor = .white
           button.setTitle("LogIn", for: .normal)
           button.layer.shadowOffset = CGSize(width: 2, height: 2)
           button.layer.shadowRadius = 1
           button.layer.shadowColor = UIColor.black.cgColor
           button.layer.shadowOpacity = 0.2
           button.clipsToBounds = true
           button.layer.cornerRadius = 10
           button.setBackgroundImage(UIImage(named: "blue_pixel"), for: UIControl.State.normal)
           return button
       }()
    let notificationCenter = NotificationCenter.default
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        view.addSubview(logInView)
        logInView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(logInView)
        view.addSubview(logoView)
        logoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTextField)
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginBlueButton)
        loginBlueButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                    logInView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    logInView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                    logInView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                    logInView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                    logInView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                    scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                    scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                    scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                    logoView.topAnchor.constraint(equalTo: logInView.safeAreaLayoutGuide.topAnchor, constant: 120),
                    logoView.centerXAnchor.constraint(equalTo: logInView.safeAreaLayoutGuide.centerXAnchor),
                    logoView.heightAnchor.constraint(equalToConstant: 100),
                    logoView.widthAnchor.constraint(equalToConstant: 100),
                    loginTextField.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
                    loginTextField.leadingAnchor.constraint(equalTo: logInView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                    loginTextField.heightAnchor.constraint(equalToConstant: 50),
                    loginTextField.trailingAnchor.constraint(equalTo: logInView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                    passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
                    passwordTextField.leadingAnchor.constraint(equalTo: logInView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                    passwordTextField.heightAnchor.constraint(equalToConstant: 50),
                    passwordTextField.trailingAnchor.constraint(equalTo: logInView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                    loginBlueButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
                    loginBlueButton.leadingAnchor.constraint(equalTo: logInView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                    loginBlueButton.heightAnchor.constraint(equalToConstant: 50),
                    loginBlueButton.trailingAnchor.constraint(equalTo: logInView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                    loginBlueButton.bottomAnchor.constraint(equalTo: logInView.safeAreaLayoutGuide.bottomAnchor)
                    ])
            }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc func toProfile() {
            let profileView = ProfileViewController()
            navigationController?.pushViewController(profileView, animated: true)
        }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            notificationCenter.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            notificationCenter.addObserver(self, selector: #selector(keyboadrdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    @objc private func keyboardShow(notification: NSNotification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                scrollView.contentInset.bottom = keyboardSize.height
                scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            }
        }
        @objc private func keyboadrdHide() {
            scrollView.contentInset.bottom = .zero
            scrollView.verticalScrollIndicatorInsets = .zero
        }
}
