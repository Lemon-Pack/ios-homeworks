//
//  InfoViewController.swift
//  Navigation
//
//  Created by Mac on 27.05.2022.
//

import UIKit

class InfoViewController: UIViewController {
    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Alert", for: .normal)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(alertButton)
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])    }
    @objc func showAlert() {
        let alert = UIAlertController(title: "Alert!", message: "Warning!", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(cancel)
        let okay = UIAlertAction(title: "Ok", style: .default) {_ in
            print("Okay")
        }
        alert.addAction(okay)
        present(alert, animated: true)
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
