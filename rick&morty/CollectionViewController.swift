//
//  CollectionViewController.swift
//  rick&morty
//
//  Created by Alperen Kişi on 11/05/2021.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    lazy var mainCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout:collectionViewLayout )
        return collectionView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
