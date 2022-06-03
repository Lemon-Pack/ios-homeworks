//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Mac on 02.06.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    private lazy var pressedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "image-1"))
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 3
        return imageView
    }()
    private lazy var nameLable: UILabel = {
        let nameLable = UILabel()
        nameLable.text = "Sergey Maletin"
        nameLable.font = .boldSystemFont(ofSize: 18)
        return nameLable
    }()
    lazy var status: UILabel = {
        let status = UILabel()
        status.text = "Per aspera ad astra"
        status.font = .systemFont(ofSize: 14)
        status.textColor = .gray
        return status
    }()
    override init(frame:CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLable)
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pressedButton)
        pressedButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(status)
        status.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            nameLable.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            nameLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLable.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            pressedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            pressedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            pressedButton.topAnchor.constraint(equalTo: topAnchor, constant: 132),
            pressedButton.widthAnchor.constraint(equalToConstant: 358),
            pressedButton.heightAnchor.constraint(equalToConstant: 50),
            status.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            status.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            status.bottomAnchor.constraint(equalTo: pressedButton.topAnchor, constant: -34)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func buttonPressed() {
        print(status.text!)
    }
}
