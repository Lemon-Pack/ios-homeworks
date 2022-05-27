//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Mac on 07.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            //     let view = UINib(nibName: "ProfileView", bundle: .main).instantiate(withOwner: nil, options: nil).first as! UIView
        guard let view = Bundle.main.loadNibNamed(
            "ProfileView",
            owner: self,
            options: nil
        )?.first as? ProfileView else { return }
        
        self.view.addSubview(view)
    }
}
