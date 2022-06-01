//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Mac on 26.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        return profileHeaderView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .lightGray
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeaderView)
        view.addSubview(newButton)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            newButton.leadingAnchor.constraint(equalTo:
                                            view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.topAnchor.constraint(equalTo: profileHeaderView.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            newButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private lazy var newButton: UIButton = {
        let button = UIButton()
        button.setTitle("New button", for: .normal)
        button.backgroundColor = UIColor.systemCyan
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonPressed() {
        print(profileHeaderView.status.text!)
    }
}
