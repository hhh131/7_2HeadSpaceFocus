//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by 신희권 on 2023/02/07.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
    @IBOutlet var titleLabel: UILabel!
    func configure (_ title: String)
    {
        titleLabel.text = title
        
    }
    
}
