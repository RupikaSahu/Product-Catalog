//
//  ProductTableViewCell.swift
//  ProductCatalog
//
//  Created by Rupika Sahu on 28/09/20.
//  Copyright © 2020 Rupika Sahu. All rights reserved.
//

import UIKit
import SDWebImage

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productBadgeLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productStrikeOffPriceLabel: UILabel!
    @IBOutlet weak var productRatingLabel: UILabel!
    @IBOutlet weak var productRatingCountLabel: UILabel!
    @IBOutlet weak var productDeliveryImageView: UIImageView!
    @IBOutlet weak var productNoOfOffersLabel: UILabel!
    @IBOutlet weak var addToBagButton: UIButton!
    
    var addToBag: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productBadgeLabel.layer.cornerRadius = 3
        productBadgeLabel.layer.masksToBounds = true
        addToBagButton.layer.cornerRadius = 5
        addToBagButton.layer.masksToBounds = true
    }
    
    @IBAction func didTapOnAddToBagButton(_ sender: Any) {
        self.addToBag?()
    }
    
    func customizeCell(product: Product) {
        if let badge = product.badge?.merchantBadge, badge.lowercased() != "none" {
            productBadgeLabel.isHidden = false
            productBadgeLabel.text = " " + badge + " "
        } else {
            productBadgeLabel.isHidden = true
        }
        
        productImageView.sd_setImage(with: URL(string: product.images?[0] ?? ""), placeholderImage: UIImage(named: "phonePlaceholder"), options: .allowInvalidSSLCertificates, completed: nil)
        productNameLabel.text = product.name ?? Constant.samsung
        
        //Instead of minimum price, need to add other price to show price range, code is written & commented at the end of the file as not sure about the minimum price.
        productPriceLabel.text = product.price?.priceDisplay ?? product.price?.offerPriceDisplay

        if let strikeThroughPrice = product.price?.strikeThroughPriceDisplay {
            let attributedStrikeOffText = NSMutableAttributedString()
            attributedStrikeOffText.append(Constant.getAttributedStrikeOffText(withText: strikeThroughPrice, color: .battleshipGray))
            if let discount = product.price?.discount, discount > 0 {
                attributedStrikeOffText.append(Constant.getAttributedLargeText(withText: " " + "\(discount)" + Constant.percent, color: UIColor.red))
            }
            productStrikeOffPriceLabel.attributedText = attributedStrikeOffText
        } else {
            productStrikeOffPriceLabel.text = nil
        }
        
        if let rating = product.review?.rating, rating > 0 {
            let attributedRatingText = NSMutableAttributedString(string: "")
            let remainingRating = 5 - rating
            for _ in 0..<rating {
                attributedRatingText.append(NSAttributedString(attachment: Constant.getAttachement(withImage: "rating")))
                attributedRatingText.append(NSAttributedString(string: " "))
            }
            for i in 0..<remainingRating {
                attributedRatingText.append(NSAttributedString(attachment: Constant.getAttachement(withImage: "ratingGray")))
                if i + 1 != remainingRating {
                    attributedRatingText.append(NSAttributedString(string: " "))
                }
            }
            productRatingLabel.attributedText = attributedRatingText
            if let noOfRatings = product.review?.count, noOfRatings > 0 {
                productRatingCountLabel.text = "(" + String(noOfRatings) + ")"
            }
        } else {
            productRatingLabel.text = nil
            productRatingCountLabel.text = nil
        }
        
        if let offeringsCount = product.otherOfferings?.count, offeringsCount > 0, let price = product.otherOfferings?.startPrice {
            let attributedOfferText = NSMutableAttributedString()
            attributedOfferText.append(Constant.getAttributedSmallText(withText: String(offeringsCount) + (offeringsCount > 1 ? Constant.offersAre : Constant.offerIs) + Constant.availableWithPrice, color: .darkGray))
            attributedOfferText.append(Constant.getAttributedLargeText(withText: price, color: .charcoalGray))
            productNoOfOffersLabel.attributedText = attributedOfferText
        } else {
            productNoOfOffersLabel.text = nil
        }
        
        productDeliveryImageView.image = (product.tags?.contains("BLIBLI_SHIPPING") ?? false) ? UIImage(named: "delivery") : nil
    }
}

//        if let minPrice = product.price?.minPrice, let maxPrice = product.price?.priceDisplay {
//            productPriceLabel.text = "Rp " + String(minPrice) + " - " + String(maxPrice)
//        } else if let minPrice = product.price?.minPrice {
//            productPriceLabel.text = String(minPrice)
//        } else {
//            productPriceLabel.text = String(describing: product.price?.priceDisplay ?? product.price?.offerPriceDisplay)
//        }
