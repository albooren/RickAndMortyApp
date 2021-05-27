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
        setupConstraintWithSnapKit()
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
    
    private func setupConstraintWithSnapKit(){
        doneButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp_topMargin).inset(26)
            make.leading.equalTo(view.snp_leadingMargin).inset(20)
        }
        charNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp_topMargin).inset(70)
            make.leading.equalTo(view.snp_leadingMargin).inset(20)
        }
        charImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(90)
            make.top.equalTo(charNameLabel.snp_bottomMargin).inset(-40)
            make.left.equalTo(view.snp_leftMargin).inset(20)
        }
        currentStatusLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(charImageView.snp_trailingMargin).inset(-40)
            make.top.equalTo(view.snp_topMargin).inset(150)
        }
        genderLabel.snp.makeConstraints { (make) in
            make.top.equalTo(currentStatusLabel.snp_bottomMargin).inset(-20)
            make.leading.equalTo(charImageView.snp_trailingMargin).inset(-40)
        }
        dropDownMenu.snp.makeConstraints { (make) in
            make.top.equalTo(charImageView.snp_bottomMargin).inset(-50)
            make.width.equalTo(335)
            make.centerX.equalTo(view.snp_centerXWithinMargins)
            make.height.equalTo(60)
        }
    }
    
    func getData() {
        charNameLabel.text = detailViewModel?.characterModel?.name
        charImageView.sd_setImage(with: URL(string: detailViewModel?.characterModel?.image ?? ""))
        currentStatusLabel.text = "\(detailViewModel?.characterModel?.status ?? ""), \(detailViewModel?.characterModel?.species ?? "")"
        genderLabel.text = detailViewModel?.characterModel?.gender
        detailViewModel?.getEpisodeDetail(onCompleted: { [weak self] (data) in
            guard let self = self else { return }
            self.dropDownMenu.optionArray = data
        }, onFailed: {
            self.showError(alertTitle: "Hata!", alertSubtitle: "Detay sayfası yüklenemedi!", okButtonTitle:"Tamam")
        })
    }
    
    @objc func doneTapped() {
        dismiss(animated: true, completion: nil)
    }
}

