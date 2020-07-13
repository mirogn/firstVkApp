//
//  TableViewController.swift
//  vkApp
//
//  Created by Геннадий Новиков on 10.07.2020.
//  Copyright © 2020 Геннадий Новиков. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Table VC Loaded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Table VC will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Table VC Did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Table VC will Disappear")
    }
}
