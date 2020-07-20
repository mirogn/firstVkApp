//
//  UserFriendsViewController.swift
//  vkApp
//
//  Created by Геннадий Новиков on 12.07.2020.
//  Copyright © 2020 Геннадий Новиков. All rights reserved.
//

import UIKit

class UserFriendsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var friend = [

        FriendDAta(friendName: "Имя", friendSecondName: "Фамилия")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            
            layout.itemSize = CGSize(width: 100, height: 100)
        }
    }
}
extension UserFriendsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friend.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? FriendsCEll else { fatalError() }
        
        let data = friend[indexPath.row]
        cell.friendName.text = String(data.friendName)
        cell.friendSecondName.text = String(data.friendSecondName)
        
        return cell
    }
    
    
}
