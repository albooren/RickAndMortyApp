//
//  MainCollectionViewCell.swift
//  rick&morty
//
//  Created by Alperen Kişi on 12/05/2021.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainCollectionViewCell"
    
    private lazy var charMainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rick")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var charNameLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(charMainImage)
        contentView.addSubview(charNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        charNameLabel.frame = CGRect(x: 15, y: contentView.frame.size.height-5, width: contentView.frame.size.width - 10, height: 50)
        charMainImage.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
    }
}
