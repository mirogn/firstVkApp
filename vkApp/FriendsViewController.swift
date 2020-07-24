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
    
    private var friendsArray = [
        
        FriendDAta(friendName: "Антон"),
        FriendDAta(friendName: "Андрей"),
        FriendDAta(friendName: "Анна"),
        FriendDAta(friendName: "Борис"),
        FriendDAta(friendName: "Валентина"),
        FriendDAta(friendName: "Геннадий"),
        FriendDAta(friendName: "Дмитрий"),
        FriendDAta(friendName: "Сергей"),
        FriendDAta(friendName: "Роман"),
        FriendDAta(friendName: "Петр"),
        FriendDAta(friendName: "Ярослав"),
        FriendDAta(friendName: "Константин"),
        FriendDAta(friendName: "Светлана"),
        
    ]
    
    private var filteredFriends = [FriendDAta]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchIsEmpty
    }
    
    
    var sections: [Character: [String]] = [:]
    var sectionTitles = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Настройка Search Controller
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Найти друга"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        tableView.dataSource = self
        tableView.delegate = self
//        
//        tableView.register(UINib(nibName: "FriendCell", bundle: nil), forCellReuseIdentifier: "FriendCell")
        
        for friend in friendsArray {
            let firstLetter = friend.friendName.first!
            
            if sections[firstLetter] != nil {
                sections[firstLetter]?.append(friend.friendName)
            } else {
                sections[firstLetter] = [friend.friendName]
            }
        }
        
        sectionTitles = Array(sections.keys)
        
    }
    
    @IBAction func refreshTable(_ sender: Any) {
        friendsArray.shuffle()
        tableView.reloadData()
    }
}

extension FriendsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
            return filteredFriends.count
        }
        
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
        
        var friends: FriendDAta
        
        if isFiltering {
            friends = filteredFriends[indexPath.row]
        } else {
            friends = friendsArray[indexPath.row]
        }
        
        cell.titleLabel.text = friends.friendName
        
        
        
        return  cell
        
    }
}

extension FriendsViewController: UITableViewDelegate {
}

extension FriendsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchTExt: String) {
        
        filteredFriends = friendsArray.filter({ (friends: FriendDAta) -> Bool in
            return friends.friendName.lowercased().contains(searchTExt.lowercased())
        })
        
        tableView.reloadData()
    }

}
