//
//  ViewController.swift
//  rick&morty
//
//  Created by Alperen Kişi on 11/05/2021.
//

import UIKit
import SDWebImage
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: - UI Objects -
    private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Characters"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    private var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    private var mainViewModel = MainViewModel()
    
    public var loadingView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        addSubview()
        setupConstraintWithSnapKit()
//        setupConstraints()
        prepForUiCollectionView()
        setupLoadingView()
        getData()
    }
    private func setupConstraintWithSnapKit() {
        welcomeLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp_leadingMargin).offset(20)
            make.top.equalTo(view.snp_topMargin).offset(50)
            make.height.equalTo(29)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-29)
            make.bottom.equalTo(mainCollectionView.snp_topMargin).offset(-30)
        }
        mainCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(welcomeLabel.snp_bottomMargin).inset(30)
            make.bottom.equalTo(view.snp_bottomMargin)
            make.width.equalTo(view.snp.width)
        }
        
    }
    
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
////            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
////            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
////            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
////            welcomeLabel.heightAnchor.constraint(equalToConstant: 29),
////
////            mainCollectionView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,constant: 20),
////            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
////            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
////            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
//        ])
//
//    }
    
    public func setupLoadingView(){
        loadingView = UIView(frame: view.bounds)
        loadingView.backgroundColor = GenericColor.loadingIndicatorBackgroundColor
        let loadingIndicator = UIActivityIndicatorView(style: .whiteLarge)
        loadingIndicator.center = loadingView.center
        loadingIndicator.startAnimating()
        loadingView.addSubview(loadingIndicator)
        view.addSubview(loadingView)
    }
    
    public func endLoadingView() {
        loadingView.removeFromSuperview()
    }
    
    private func addSubview(){
        view.addSubview(welcomeLabel)
        view.addSubview(mainCollectionView)
    }
    
    private func prepForUiCollectionView(){
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
    }
    
    private func getData() {
        mainViewModel.getCharactersData(onCompleted: { [weak self] in
            guard let self = self else { return }
            self.mainCollectionView.reloadData()
            self.endLoadingView()
        }, onFailed: { [weak self] in
            guard let self = self else { return }
            self.showError(alertTitle: "Hata!", alertSubtitle: "Veriler Yüklenemedi!", okButtonTitle: "Tamam")
        })
    }
}
extension MainViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainViewModel.characterList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell {
            cell.charNameLabel.text = mainViewModel.characterList[indexPath.row].name
            cell.charMainImage.sd_setImage(with: URL(string: mainViewModel.characterList[indexPath.row].image ?? ""))
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        let model = mainViewModel.characterList[indexPath.row]
        detailViewController.detailViewModel = DetailViewModel(characterModel: model)
        present(detailViewController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width/2)-5, height: 250)
    }
}

