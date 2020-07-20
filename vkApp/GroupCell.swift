//
//  GroupCell.swift
//  vkApp
//
//  Created by Геннадий Новиков on 18.07.2020.
//  Copyright © 2020 Геннадий Новиков. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avatarContainerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        avatarContainerView.layer.cornerRadius = avatarContainerView.bounds.width / 2
        avatarContainerView.layer.shadowColor = UIColor.black.cgColor
        avatarContainerView.layer.shadowRadius = 10
        avatarContainerView.layer.shadowOpacity = 0.2
        avatarContainerView.layer.shadowOffset = .zero
        avatarContainerView.layer.shadowPath = UIBezierPath(ovalIn: avatarContainerView.bounds).cgPath

        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
        avatarImageView.clipsToBounds = true
    }
}
