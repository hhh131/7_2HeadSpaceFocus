//
//  QuickFocusCell.swift
//  HeadSpaceFocus
//
//  Created by 신희권 on 2023/02/06.
//

import UIKit

class QuickFocusCell: UICollectionViewCell {
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    func configure(_ quickFoucs: QuickFocus){
        imageView.image =  UIImage(named: quickFoucs.imageName)
        titleLabel.text = quickFoucs.title
        descriptionLabel.text = quickFoucs.description
    }
}
