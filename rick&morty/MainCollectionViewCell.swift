//
//  MainCollectionViewCell.swift
//  rick&morty
//
//  Created by Alperen Kişi on 12/05/2021.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainCollectionViewCell"
    
    private var charMainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "rick")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var charNameLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST"
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
            
            charNameLabel.topAnchor.constraint(equalTo: charMainImage.bottomAnchor, constant: 10),
            charNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }
    
    func addSubviews() {
        addSubview(charMainImage)
        addSubview(charNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
