//
//  FeedViewController.swift
//  Navigation
//
//  Created by Mac on 26.05.2022.
//

import UIKit

class FeedViewController: UIViewController {

        private lazy var postButton: UIButton = {
            let button = UIButton()
            button.setTitle("Open", for: .normal)
            button.addTarget(self, action: #selector(openPost), for: .touchUpInside)
            return button
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubview(postButton)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    @objc func openPost() {
        let postt = Post(title: "Amazing!")
        let post = PostViewController(post: postt)
        navigationController?.pushViewController(post, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
