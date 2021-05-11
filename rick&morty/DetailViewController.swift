//
//  DetailViewController.swift
//  rick&morty
//
//  Created by Alperen Kişi on 11/05/2021.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - UI Objects -
    
    lazy var charNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Characters"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    lazy var charImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = imageView.frame.size.width / 8
        return imageView
    }()
    lazy var currentStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 21)
        return label
    }()
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            charNameLabel.widthAnchor.constraint(equalToConstant: 174),
            charNameLabel.heightAnchor.constraint(equalToConstant: 34),
            charNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 106),
            charNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.5),
            
            charImageView.widthAnchor.constraint(equalToConstant: 90),
            charImageView.heightAnchor.constraint(equalToConstant: 90),
            charImageView.topAnchor.constraint(equalTo: charNameLabel.bottomAnchor, constant: 20),
            charImageView.leftAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            currentStatusLabel.leftAnchor.constraint(equalTo: charImageView.rightAnchor, constant: 18),
            currentStatusLabel.topAnchor.constraint(equalTo: charNameLabel.bottomAnchor, constant: 43),
            currentStatusLabel.bottomAnchor.constraint(equalTo: genderLabel.topAnchor, constant: 14),
            
            genderLabel.leftAnchor.constraint(equalTo: charImageView.rightAnchor, constant: 18),
            genderLabel.topAnchor.constraint(equalTo: currentStatusLabel.bottomAnchor, constant: 14)
        ])
    }
    
}
