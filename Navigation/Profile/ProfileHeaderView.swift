//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Mac on 30.05.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    private lazy var pressedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 16,
                                            y: 132,
                                            width: 358,
                                            height: 50))
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
    private lazy var status: UILabel = {
        let status = UILabel()
        status.text = "Per aspera ad astra"
        status.font = .systemFont(ofSize: 14)
        status.textColor = .gray
        return status
    }()
    override init(frame:CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(nameLable)
        addSubview(pressedButton)
        addSubview(status)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 16,
                                 y: 16,
                                 width: 100,
                                 height: 100)
        nameLable.frame = CGRect(x: 16 + 100 + 16,
                                 y: 27,
                                 width: self.bounds.width - (16 + 100 + 16) - 16,
                                 height: 32)
        status.frame = CGRect(x: 132,
                              y: 132 - 25 - 34,
                              width: self.bounds.width - (16 + 100 + 16) - 16,
                              height: 28)
    }
    @objc func buttonPressed() {
        print(status.text!)
    }
}
