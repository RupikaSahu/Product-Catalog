//
//  Constant.swift
//  ProductCatalog
//
//  Created by Rupika Sahu on 28/09/20.
//  Copyright © 2020 Rupika Sahu. All rights reserved.
//

import UIKit

struct AppURLS {
    static let productSearchUrl = "https://www.blibli.com/backend/search/products?searchTerm=samsung&start=0&itemPerPage=24"
}

struct Constant {
    static let ok = "OK"
    static let cancel = "Cancel"
    static let error = "Error!!!"
    static let failed = "Failed..."
    static let percent = "% OFF"
    static let samsung = "Samsung"
    static let offerIs = " offer is"
    static let offersAre = " offers are"
    static let emptyTextTitle = "No Text !!!"
    static let searchResults = " search results"
    static let availableWithPrice = " availble with price "
    static let productAddedTitle = "Product goes to Cart!!!"
    static let productAddedMessage = "Adding prodcut to cart"
    static let emptyTextMessage = "Please enter the prouduct name"
    
}

extension Constant {
    static func getAttributedSmallText(withText text: String, color: UIColor) -> NSAttributedString {
        return NSAttributedString(string: text, attributes: [NSAttributedString.Key.strikethroughColor: color, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0, weight: .regular), NSAttributedString.Key.foregroundColor: color])
    }
    
    static func getAttributedLargeText(withText text: String, color: UIColor) -> NSAttributedString {
        return NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0, weight: .medium), NSAttributedString.Key.foregroundColor: color])
    }
    
    static func getAttributedStrikeOffText(withText text: String, color: UIColor) -> NSAttributedString {
        return NSAttributedString(string: text, attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.strikethroughColor: color, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0, weight: .medium), NSAttributedString.Key.foregroundColor: color])
    }
    
    static func getAttachement(withImage image: String) -> NSTextAttachment {
        let starAttachment = NSTextAttachment()
        starAttachment.image = UIImage(named: image)!
        starAttachment.bounds = CGRect(x: 0.0, y: -1.5, width: 12.0, height: 12.0)
        return starAttachment
    }
}

extension UIViewController {
    func showAlert(withTitle title: String, message: String, okAction: ((UIAlertAction) -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: Constant.ok, style: .cancel, handler: okAction))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func showAlertToAddProducts(withTitle title: String, message: String, okAction: ((UIAlertAction) -> Void)? = nil, cancelAction: ((UIAlertAction) -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: Constant.ok, style: .cancel, handler: okAction))
        alertVC.addAction(UIAlertAction(title: Constant.cancel, style: .destructive, handler: cancelAction))
        self.present(alertVC, animated: true, completion: nil)
    }
}

extension UIDevice {
    var hasTopNotch: Bool {
        if #available(iOS 11.0, tvOS 11.0, *) {
            let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
            return keyWindow?.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }
}

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIColor {
    static let battleshipGray = UIColor(red: 109/255, green: 120/255, blue: 137/255, alpha: 1.0)
    static let charcoalGray = UIColor(red: 62/255, green: 66/255, blue: 77/255, alpha: 1.0)
}
