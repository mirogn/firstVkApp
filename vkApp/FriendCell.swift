//
//  GroupCell.swift
//  vkApp
//
//  Created by Геннадий Новиков on 11.07.2020.
//  Copyright © 2020 Геннадий Новиков. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avatarContainerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    let likeControl = LikeControl()
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        likeControl.translatesAutoresizingMaskIntoConstraints = false
        
        avatarContainerView.layer.cornerRadius = avatarContainerView.bounds.width / 2
        avatarContainerView.layer.shadowColor = UIColor.black.cgColor
        avatarContainerView.layer.shadowRadius = 10
        avatarContainerView.layer.shadowOpacity = 0.2
        avatarContainerView.layer.shadowOffset = .zero
        avatarContainerView.layer.shadowPath = UIBezierPath(ovalIn: avatarContainerView.bounds).cgPath

        contentView.addSubview(likeControl)
        
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
        avatarImageView.clipsToBounds = true
        
        let likeConstraints = [
            likeControl.leftAnchor.constraint(equalTo: titleLabel.rightAnchor),
            likeControl.rightAnchor.constraint(equalTo: rightAnchor),
            likeControl.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(likeConstraints)
    }
}
