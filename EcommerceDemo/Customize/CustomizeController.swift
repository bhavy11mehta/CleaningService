//
//  CustomizeController.swift
//  EcommerceDemo
//
//  Created by gwl-42 on 27/11/23.
//

import UIKit

class CustomizeController: UIViewController {
    
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblQty: UILabel!
    @IBOutlet weak var qtyView: UIView!
    @IBOutlet weak var btnAddCart: UIButton!
    @IBOutlet weak var tblBhk: UITableView!
    var customizeViewModel = CustomizeViewModel()
   
    var sectionIndex : Int = 0
    var qtyBhk : Int = 1
    var cartValue : Int = 0
    var bhkAllowance : Int = 0
    var strSection: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appartment =  customizeViewModel.dataModification()
        lblHeader.text = appartment?.name?.first
        strSection = appartment?.specifications?.first?.name?.first
        btnAddCart.layer.cornerRadius = 20
        qtyView.layer.cornerRadius = 20
        qtyView.layer.masksToBounds = true
        qtyView.layer.borderWidth = 1
        qtyView.layer.borderColor = UIColor.systemMint.cgColor
        manageQty()
    }
    @IBAction func btnMinusClick(_ sender: Any) {
        if qtyBhk > 1 {
            qtyBhk -= 1
        }
        manageQty()
        lblQty.text = String(qtyBhk)
    }
    @IBAction func btnPlusClick(_ sender: Any) {
        qtyBhk += 1
       manageQty()
        lblQty.text = String(qtyBhk)
    }
    func manageQty() {
        cartValue = qtyBhk * (customizeViewModel.arrAppartmentModification.parentAppartment[sectionIndex].price ?? 0)
        cartValue = cartValue + bhkAllowance
        let strCart = "Add to Cart- \u{20B9}\(cartValue)"
        btnAddCart.setTitle(strCart, for: .normal)
    }
}

extension CustomizeController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return customizeViewModel.arrAppartmentModification.parentAppartment[sectionIndex].specifications.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return customizeViewModel.arrAppartmentModification.parentAppartment.count
        }
        else {
            return customizeViewModel.arrAppartmentModification.parentAppartment[sectionIndex].specifications[section-1].list?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BhkCell", for: indexPath) as! BhkCell
            cell.selectionStyle = .none
            let bhk = customizeViewModel.arrAppartmentModification.parentAppartment[indexPath.row]
            cell.lblPrice.text = "\u{20B9} \(String(bhk.price ?? 0))"
            cell.lblName.text = bhk.name?.first
            if bhk.is_default_selected ?? true {
                cell.imgRadio.image = (UIImage(named:"circle_radio_selected"))
            } else {
                cell.imgRadio.image = (UIImage(named:"circle_radio_unselected"))
            }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AppartmentCell", for: indexPath) as! AppartmentCell
            cell.selectionStyle = .none
            let appartment = customizeViewModel.arrAppartmentModification.parentAppartment[sectionIndex].specifications[indexPath.section-1].list?[indexPath.row]
            if appartment?.is_default_selected ?? true {
                cell.imgCheckBox.image = (UIImage(named:"CheckedBox"))
                cell.qtyView.isHidden = false
            } else {
                cell.imgCheckBox.image = (UIImage(systemName: "square"))
                cell.qtyView.isHidden = true
            }
            if appartment?.price != 0 {
                cell.lblPrice.text = "\u{20B9} \(String(appartment?.price ?? 0))"
            } else {
                cell.lblPrice.text = ""
                cell.qtyView.isHidden = true
            }
            cell.lblName.text = appartment?.name?.first

          
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section ==  0 {
            for (index, _) in customizeViewModel.arrAppartmentModification.parentAppartment.enumerated() {
                if index == indexPath.row {
                    sectionIndex = index
                    // Deselect the currently selected option
                    customizeViewModel.arrAppartmentModification.parentAppartment[index].is_default_selected = true
                    manageQty()
                } else {
                    // Ensure that all other options are deselected
                    customizeViewModel.arrAppartmentModification.parentAppartment[index].is_default_selected = false
                }
            }
            
        } else {
            if customizeViewModel.arrAppartmentModification.parentAppartment[sectionIndex].specifications[indexPath.section-1].list?[indexPath.row].is_default_selected ?? true {
                customizeViewModel.arrAppartmentModification.parentAppartment[sectionIndex].specifications[indexPath.section-1].list?[indexPath.row].is_default_selected = false
                customizeViewModel.arrAppartmentModification.parentAppartment[sectionIndex].specifications[indexPath.section-1].list?[indexPath.row].qty = 0
                bhkAllowance = bhkAllowance - (customizeViewModel.arrAppartmentModification.parentAppartment[sectionIndex].specifications[indexPath.section-1].list?[indexPath.row].price ?? 0)
                manageQty()
              
            } else {
                customizeViewModel.arrAppartmentModification.parentAppartment[sectionIndex].specifications[indexPath.section-1].list?[indexPath.row].is_default_selected = true
                customizeViewModel.arrAppartmentModification.parentAppartment[sectionIndex].specifications[indexPath.section-1].list?[indexPath.row].qty = 1
                let allowance = (customizeViewModel.arrAppartmentModification.parentAppartment[sectionIndex].specifications[indexPath.section-1].list?[indexPath.row].qty ?? 0) * (customizeViewModel.arrAppartmentModification.parentAppartment[sectionIndex].specifications[indexPath.section-1].list?[indexPath.row].price ?? 0)
                bhkAllowance = bhkAllowance + allowance
               manageQty()
            }
          
        }
        tblBhk.reloadData()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        headerView.backgroundColor = UIColor.white
        
        let dividerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 5))
        dividerLabel.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1)
        headerView.addSubview(dividerLabel)
        
        
        let titleLabel = UILabel(frame: CGRect(x: 15, y: 15, width: tableView.frame.size.width - 30, height: 20))
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = UIColor.black
        headerView.addSubview(titleLabel)
        
        let subtitleLabel = UILabel(frame: CGRect(x: 15, y: 35, width: tableView.frame.size.width - 30, height: 15))
        
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.textColor = UIColor.gray
        headerView.addSubview(subtitleLabel)
        
        if section == 0 {
            titleLabel.text = (strSection ?? "") + "*"
            subtitleLabel.text = "Choose 1"
        }
        else {
            titleLabel.text =  customizeViewModel.arrAppartmentModification.parentAppartment[sectionIndex].specifications[section-1].name?.first
            subtitleLabel.text = "Choose up to 1"
        }
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

