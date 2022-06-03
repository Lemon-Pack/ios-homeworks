//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Mac on 26.05.2022.
//
import UIKit

class ProfileViewController: UIViewController {
     var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        return profileHeaderView
    }()
     lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = .zero
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.indentifire)
        return tableView
    }()
    private lazy var news = Lenta.News()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.addSubview(profileHeaderView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.title = "Profile"
        view.backgroundColor = .white
        constraintHeaderView()
    }
    private func constraintHeaderView() {
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            tableView.topAnchor.constraint(equalTo: profileHeaderView.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.indentifire, for: indexPath) as! PostTableViewCell
        cell.setupCell(news[indexPath.row])
        return cell
    }
}
    extension ProfileViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    }
    extension ProfileViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            view.endEditing(true)
            return true
        }
    }
    extension ProfileViewController: UITextViewDelegate {
        func hideKeyboardTapperAround() {
            let press: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
            press.cancelsTouchesInView = false
            view.addGestureRecognizer(press)
        }
        @objc func dismissKeyboard(){
            view.endEditing(true)
        }
    }
