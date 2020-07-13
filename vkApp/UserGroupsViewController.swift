//
//  FriendsViewController.swift
//  vkApp
//
//  Created by Геннадий Новиков on 11.07.2020.
//  Copyright © 2020 Геннадий Новиков. All rights reserved.
//

import UIKit

class UserGroupViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var friends = [
        
        "Swift для чайников",
        "Чайник для Swift",
        "Зачем я на это подписался",
        "Как же тяжело",
        "Когда ничего не понимаешь",
        "Как все понимать?",
        "WTF??",
        "Группа для тех кто в танке",
        "Swift для детей",
        "Поиск работы",
        "Как пользоваться GIT?",
        "Как все успевать?",
        "Почему я ничего не понимаю?",
        "Посмотреть фильмы онлайн",
        "Сериалы 2020",
        "Астрономия длятначинающих",
        "Радио - Чайник"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    @IBAction func refreshTable(_ sender: Any) {
        friends.shuffle()
        tableView.reloadData()
    }
    
    @IBAction func addGroups(_ sender: Any) {
        let alert = UIAlertController(title: "Добавить группу", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
        textField.placeholder = "Название"
        }
        
        let action = UIAlertAction(title: "OK", style: .default) { [weak self, weak alert] (action) in
            guard let firstText = alert?.textFields?.first?.text else { return }
            self?.addGroup(name: firstText)
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func addGroup(name: String) {
        guard !name.isEmpty else { return }
        friends.insert(name, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}

extension UserGroupViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as? FriendCell else { fatalError() }
        
        cell.titleLabel.text = friends[indexPath.row]
        
        print("Cell created for row: \(indexPath.row), \(friends[indexPath.row])")
        
        return  cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            friends.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}

extension UserGroupViewController: UITableViewDelegate {
}
