//
//  ViewController.swift
//  rick&morty
//
//  Created by Alperen Kişi on 11/05/2021.
//

import UIKit

class ViewController: UIViewController {
  
    // MARK: - UI Objects -
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Characters"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 50
        layout.minimumInteritemSpacing = 0
//        layout.estimatedItemSize = CGSize(width: 157, height: 180)
        layout.itemSize = CGSize(width: (view.frame.size.width-20)/2, height: 210)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(welcomeLabel)
        addSubview()
        setupConstraints()
        prepForUiCollectionView()
    
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.widthAnchor.constraint(equalToConstant: 135),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 29),
            welcomeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            welcomeLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 220),
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 109),
            
            mainCollectionView.widthAnchor.constraint(equalToConstant: view.frame.width),
            mainCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height),
            mainCollectionView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
          

        ])
       
    }
    func addSubview(){
        view.addSubview(welcomeLabel)
        view.addSubview(mainCollectionView)
    }
    
}
extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func prepForUiCollectionView(){
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row) tıklandı")
    }
    
    
    
    
    
    
    
    
}

