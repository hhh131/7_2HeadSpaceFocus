//
//  QuickFocusListViewController.swift
//  HeadSpaceFocus
//
//  Created by 신희권 on 2023/02/06.
//

import UIKit

class QuickFocusListViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    let breathingList = QuickFocus.breathing
    let walkingList = QuickFocus.walking
    
    enum Section: CaseIterable {
        case breathe
        case walking
        
        var title : String {
            switch self {
            case .breathe: return "Breathing excercises"
            case .walking: return "Mindful walks"
                
            }
        }
    }
    typealias Item = QuickFocus
    var datasource : UICollectionViewDiffableDataSource<Section,Item>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Presentation
        datasource = UICollectionViewDiffableDataSource<Section,Item>(collectionView: collectionView,
                                                                      cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickFocusCell", for: indexPath) as? QuickFocusCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // Data
        var snapshot = NSDiffableDataSourceSnapshot<Section,Item>()
        snapshot.appendSections([.breathe,.walking])
        snapshot.appendItems(breathingList, toSection: .breathe)
        snapshot.appendItems(walkingList, toSection: .walking)
        datasource.apply(snapshot)
        
        
        
//
//        var snapshot = NSDiffableDataSourceSnapshot<Section,Item>()
//        snapshot.appendSections(Section.allCases) //snapshot.appendSections([.breathe,.walking])
//        snapshot.appendItems(breathingList, toSection: .breathe)
//        snapshot.appendItems(walkingList, toSection: .walking)
//        datasource.apply(snapshot)
//
//
        //Layout
        collectionView.collectionViewLayout = layout()
        collectionView.delegate = self
        
        
        
    }
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item , count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        
        return layout
    }
    
    
    
}

extension QuickFocusListViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}
