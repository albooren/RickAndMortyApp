//
//  MainCollectionViewCell.swift
//  rick&morty
//
//  Created by Alperen Kişi on 12/05/2021.
//

import UIKit
import SDWebImage

class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionViewCell"
    private var mainViewModel = MainViewModel()

    
     var charMainImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 157, height: 180))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.image = UIImage(named: "rick")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var charNameLabel: UILabel = {
        let label = UILabel()
        label.text = "loading"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            charMainImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            charMainImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            charMainImage.widthAnchor.constraint(equalToConstant: 157),
            charMainImage.heightAnchor.constraint(equalToConstant: 180),
            charNameLabel.topAnchor.constraint(equalTo: charMainImage.bottomAnchor, constant: 10),
            charNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }
    func charDetail(index : Int) {
        charNameLabel.text = mainViewModel.characterList[index].name
    }
    func addSubviews() {
        addSubview(charMainImage)
        addSubview(charNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
