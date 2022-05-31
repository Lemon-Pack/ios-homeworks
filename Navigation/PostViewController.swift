//
//  PostViewController.swift
//  Navigation
//
//  Created by Mac on 26.05.2022.
//

import UIKit

class PostViewController: UIViewController {
        let post: Post
        
        init(post: Post) {
            self.post = post
            super .init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = post.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera , target: self, action: #selector(showInfo))
    }
    @objc func showInfo() {
        let postt = InfoViewController()
        present(postt, animated: true)
        
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
