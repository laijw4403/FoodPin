//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by MAC on 2020/8/23.
//  Copyright © 2020 Tommy. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    // 用於接收傳送過來的資料
    var restaurantImageName = ""
    var restaurantName = ""
    var restaurantType = ""
    var restaurantLocation = ""
    
    // 更新細節視圖控制器的圖片與內容
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var restaurantTypeLabel: UILabel!
    @IBOutlet var restaurantLocationLabel: UILabel!
    
    override func viewDidLoad() {       //此方法在視圖載入記憶體時會被呼叫
        super.viewDidLoad()
        
        restaurantImageView.image = UIImage(named: restaurantImageName)
        restaurantNameLabel.text = restaurantName
        restaurantTypeLabel.text = restaurantType
        restaurantLocationLabel.text = restaurantLocation
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
