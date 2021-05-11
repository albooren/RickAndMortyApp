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
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    //collectionView

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(welcomeLabel)
        addSubview()
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.widthAnchor.constraint(equalToConstant: 135),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 29),
            welcomeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            welcomeLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 220),
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 109)
        ])
       
    }
    func addSubview(){
        view.addSubview(welcomeLabel)
    }
}

