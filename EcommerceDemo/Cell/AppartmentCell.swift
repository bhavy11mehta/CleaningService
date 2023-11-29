//
//  AppartmentCell.swift
//  EcommerceDemo
//
//  Created by gwl-42 on 28/11/23.
//

import UIKit

class AppartmentCell: UITableViewCell {
    
    @IBOutlet weak var lblQty: UILabel!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var lblNameTrailing: NSLayoutConstraint!
    @IBOutlet weak var qtyView: UIStackView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgCheckBox: UIImageView!
    var actionMinusBlock: (() -> Void)?
    var actionPlusBlock: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        qtyView.layer.cornerRadius = 20
        qtyView.layer.masksToBounds = true
        qtyView.layer.borderWidth = 1
        qtyView.layer.borderColor = UIColor.systemMint.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnMinusClick(_ sender: UIButton) {
        actionMinusBlock?()
    }
    @IBAction func btnPlusClick(_ sender: UIButton) {
        actionPlusBlock?()
    }

}
