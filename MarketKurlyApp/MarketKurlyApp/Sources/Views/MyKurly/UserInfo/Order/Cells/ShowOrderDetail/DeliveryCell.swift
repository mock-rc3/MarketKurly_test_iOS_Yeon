//
//  DeliveryCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/18.
//

import UIKit

class DeliveryCell: UITableViewCell {
    
    
    // MARK: - Components
    @IBOutlet weak var receiveName: UILabel!
    @IBOutlet weak var receivePhone: UILabel!
    @IBOutlet weak var receiveAddress: UILabel!
    @IBOutlet weak var receiveSpace: UILabel!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Functions
    func setUI(){
        
    }
}
