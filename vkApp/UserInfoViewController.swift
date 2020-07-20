//
//  UserInfoVoewController.swift
//  vkApp
//
//  Created by Геннадий Новиков on 10.07.2020.
//  Copyright © 2020 Геннадий Новиков. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    @IBOutlet weak var centerTExt: UILabel!
    var name: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        centerTExt.text = name
    }
    
    @IBAction func addWord(_ sender: UIBarButtonItem) {
        centerTExt.text = (centerTExt.text ?? "") + " Hello "
    }
}
