//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by MAC on 2020/8/9.
//  Copyright © 2020 Tommy. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    // IBOutlet用於指出可以和視圖物件連結的屬性，IBAction用於事件觸發動作方法
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!  {
         didSet {
            thumbnailImageView.layer.cornerRadius = thumbnailImageView.bounds.width / 2 // 設定圖片顯示的圓半徑
            thumbnailImageView.clipsToBounds = true      // 設定圖形可以修剪為圓角
        }
    } 
    @IBOutlet var heartImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
