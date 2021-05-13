//
//  DetailViewController.swift
//  rick&morty
//
//  Created by Alperen Kişi on 11/05/2021.
//

import UIKit
import SDWebImage
import iOSDropDown

class DetailViewController: UIViewController {
    // MARK: - UI Objects -
    
    var charNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Characters"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    var charImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rick")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 45
        imageView.clipsToBounds = true
        return imageView
    }()
    var currentStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Alive, Human"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textColor = .white
        return label
    }()
    var genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Male"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        
        return label
    }()
    var dropDownMenu: DropDown = {
        let dropDown = DropDown(frame: CGRect(x: 0, y: 0, width: 335, height: 60))
        dropDown.translatesAutoresizingMaskIntoConstraints = false
        dropDown.optionArray = ["Albo", "Cemo" ,"Alo" ,"Velo"]
        dropDown.arrowColor = .white
        dropDown.text = "   Episodes"
        dropDown.textColor = .white
        dropDown.backgroundColor = GenericColor.dropDownColor
        dropDown.cornerRadius = 12
        dropDown.allowsEditingTextAttributes = false
        dropDown.borderColor = GenericColor.dropDownColor
        dropDown.rowBackgroundColor = GenericColor.dropDownColor
        dropDown.selectedRowColor = GenericColor.dropDownColor
        dropDown.rowTextColor = .white
        return dropDown
    }()
    var doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: UIControl.State.normal)
        button.setTitleColor(GenericColor.doneButtonTitleColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(doneTapped) , for: .touchUpInside)
        return button
    }()
    
    public var detailViewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = GenericColor.detailViewControllerBackgroudColor
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
        addSubviews()
        setupConstraints()
        getData()
    }
    
    func addSubviews(){
        view.addSubview(doneButton)
        view.addSubview(charNameLabel)
        view.addSubview(charImageView)
        view.addSubview(currentStatusLabel)
        view.addSubview(genderLabel)
        view.addSubview(dropDownMenu)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            doneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 26),
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            charNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 106),
            charNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            charImageView.widthAnchor.constraint(equalToConstant: 90),
            charImageView.heightAnchor.constraint(equalToConstant: 90),
            charImageView.topAnchor.constraint(equalTo: charNameLabel.bottomAnchor, constant: 20),
            charImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            currentStatusLabel.leadingAnchor.constraint(equalTo: charImageView.trailingAnchor, constant: 18),
            currentStatusLabel.topAnchor.constraint(equalTo: charNameLabel.bottomAnchor, constant: 43),
            currentStatusLabel.bottomAnchor.constraint(equalTo: genderLabel.topAnchor, constant: -14),
            
            genderLabel.leadingAnchor.constraint(equalTo: charImageView.trailingAnchor, constant: 18),
            genderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 211),
            
            dropDownMenu.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 43),
            dropDownMenu.widthAnchor.constraint(equalToConstant: 335),
            dropDownMenu.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dropDownMenu.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func getData() {
        charNameLabel.text = detailViewModel?.characterModel?.name
        charImageView.sd_setImage(with: URL(string: detailViewModel?.characterModel?.image ?? ""))
        currentStatusLabel.text = "\(detailViewModel?.characterModel?.status ?? ""), \(detailViewModel?.characterModel?.species ?? "")"
        genderLabel.text = detailViewModel?.characterModel?.gender
        dropDownMenu.optionArray = detailViewModel?.characterModel?.episode ?? [""]
    }
    
    @objc func doneTapped() {
        dismiss(animated: true, completion: nil)
    }
}

