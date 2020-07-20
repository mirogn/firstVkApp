//
//  FriendsViewController.swift
//  vkApp
//
//  Created by Геннадий Новиков on 12.07.2020.
//  Copyright © 2020 Геннадий Новиков. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var friends = [
        
        "Антон",
        "Владимир",
        "Светлана",
        "Валентина",
        "Константин",
        "Александр",
        "Роман",
        "Сергей",
        "Антонина",
        "Евгений",
        "Юлия",
        "Андрей",
        "Алексей",
        "Татьяна",
        "Наталья",
        "Варвара",
        "Даниил"
    ]
    
    
    var sections: [Character: [String]] = [:]
    var sectionTitles = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        for friend in friends {
            let firstLetter = friend.first!
            
            if sections[firstLetter] != nil {
                sections[firstLetter]?.append(friend)
            } else {
                sections[firstLetter] = [friend]
            }
        }
        
        sectionTitles = Array(sections.keys)

    }
    
    @IBAction func refreshTable(_ sender: Any) {
        friends.shuffle()
        tableView.reloadData()
    }
}

extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[sectionTitles[section]]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles.map{ String($0) }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(sectionTitles[section])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as? FriendCell else { fatalError() }
        guard let friend = sections[sectionTitles[indexPath.section]]?[indexPath.row] else {fatalError()}
        
        
        
        cell.titleLabel.text = friend
        
        print("Cell created for row: \(indexPath.row), \(friend)")
        
        return  cell
        
    }
}

extension FriendsViewController: UITableViewDelegate {
}

