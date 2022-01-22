//
//  ItemTableViewCell.swift
//  TradeMeTest
//
//  Created by Yuan on 20/01/22.
//

import UIKit
import Kingfisher

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelReserve: UILabel!
    @IBOutlet weak var labelBuyNowPrice: UILabel!
    @IBOutlet weak var labelBuyNow: UILabel!
    @IBOutlet weak var constraintPhotoWidth: NSLayoutConstraint!
    
    var listModel: ListModel? {
        didSet {
            updateUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewPhoto.clipsToBounds = true
        imageViewPhoto.layer.cornerRadius = 4
    }
    
    private func updateUI() {
        if let pictureHref = listModel?.pictureHref, let url = URL(string: pictureHref) {
            constraintPhotoWidth.constant = 120
            imageViewPhoto.kf.setImage(with: url)
        } else {
            constraintPhotoWidth.constant = 0
            imageViewPhoto.image = nil
        }
        labelLocation.text = listModel?.region
        labelName.text = listModel?.title
        
        labelPrice.isHidden = true
        labelReserve.isHidden = true
        labelBuyNow.isHidden = true
        labelBuyNowPrice.isHidden = true
        
        if listModel?.isClassified == true { // Classified
            labelBuyNow.isHidden = false
            labelBuyNowPrice.isHidden = false
            labelBuyNow.text = "Asking price"
            labelBuyNowPrice.text = listModel?.priceDisplay
        } else if listModel?.isBuyNowOnly == true {
            labelBuyNow.isHidden = false
            labelBuyNowPrice.isHidden = false
            labelBuyNow.text = "Buy Now"
            labelBuyNowPrice.text = listModel?.priceDisplay
        } else { // Auction
            labelPrice.isHidden = false
            labelReserve.isHidden = false
            labelPrice.text = listModel?.priceDisplay
            labelReserve.text = "Current Price"
            if let buyNowPrice = listModel?.buyNowPrice {
                labelBuyNow.isHidden = false
                labelBuyNowPrice.isHidden = false
                labelBuyNow.text = "Buy Now"
                labelBuyNowPrice.text = "$\(buyNowPrice)"
            }
        }
    }
}
