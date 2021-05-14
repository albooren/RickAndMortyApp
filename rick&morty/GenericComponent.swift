//
//  GenericColor.swift
//  rick&morty
//
//  Created by Alperen Kişi on 13/05/2021.
//

import UIKit

struct GenericColor {
    static let detailViewControllerBackgroudColor = UIColor(red: 19/225, green: 20/225, blue: 21/225, alpha: 1)
    static let doneButtonTitleColor = UIColor(red: 138/225, green: 103/225, blue: 190/225, alpha: 1)
    static let dropDownColor = UIColor(red: 28/225, green: 30/225, blue: 31/225, alpha: 1)
    static let loadingIndicatorBackgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
}

extension UIViewController {
    
    func showError(alertTitle: String, alertSubtitle: String, okButtonTitle: String) {
        let alert = UIAlertController(title: alertTitle, message: alertSubtitle, preferredStyle: .alert)
        let okButton = UIAlertAction(title: okButtonTitle, style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}
