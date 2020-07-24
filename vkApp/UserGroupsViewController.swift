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
    
    var groupsArray = [
        
        GroupDAta(groupName: "Swift для чайников"),
        GroupDAta(groupName: "Чайник для Swift"),
        GroupDAta(groupName: "Зачем я на это подписался"),
        GroupDAta(groupName: "Как же тяжело"),
        GroupDAta(groupName: "Когда ничего не понимаешь"),
        GroupDAta(groupName: "Как все понимать?"),
        GroupDAta(groupName: "WTF??"),
        GroupDAta(groupName: "Группа для тех кто в танке"),
        GroupDAta(groupName: "Swift для детей"),
        GroupDAta(groupName: "Как пользоваться GIT?"),
        GroupDAta(groupName: "Как все успевать?"),
        GroupDAta(groupName: "Почему я ничего не понимаю?"),
        GroupDAta(groupName: "Посмотреть фильмы онлайн"),
        GroupDAta(groupName: "Сериалы 2020")
        
    ]
    
    private var filteredGroups = [GroupDAta]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Найти друга"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        let view = UIView()
//        view.frame = .init(x: 0, y: 0, width: 0, height: 30)
//        tableView.tableHeaderView = view
//        tableView.tableHeaderView?.backgroundColor = .secondarySystemFill
//          tableView.register(UINib(nibName: "SectionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
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
        let newGroup = GroupDAta(groupName: name)
        guard !name.isEmpty else { return }
        
        groupsArray.insert(newGroup, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}

extension UserGroupViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
        return filteredGroups.count
        }
        
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") as? GroupCell else { fatalError() }
        
        var groups: GroupDAta
        
        if isFiltering {
            groups = filteredGroups[indexPath.row]
        } else {
            groups = groupsArray[indexPath.row]
        }
        
        cell.titleLabel.text = groups.groupName
        
        return  cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groupsArray.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}

extension UserGroupViewController: UITableViewDelegate {
}

extension UserGroupViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchTExt: String) {
        
        filteredGroups = groupsArray.filter({ (groups: GroupDAta) -> Bool in
            return groups.groupName.lowercased().contains(searchTExt.lowercased())
        })
        
        tableView.reloadData()
    }

}
