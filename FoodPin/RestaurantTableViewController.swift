//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by MAC on 2020/8/9.
//  Copyright © 2020 Tommy. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    var restaurantLocation = ["Hong Kong", "Hong kong", "Hong kong", "Hong kong", "Hong kong", "Hong kong", "Hong kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantType = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrain / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    // 建立21個存放Boolean值false的陣列
    var restaurantIsVisited = Array(repeating: false, count: 21)
    override func viewDidLoad() {
        super.viewDidLoad()
        // 自動調整cell寬度
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        // 導覽列大標題
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 停用大標題
        // navigationItem.largeTitleDisplayMode = .never
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }*/

    // MARK: - Table view data source
    
    //  此方法用於告訴表格視圖有幾個區塊
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // 回傳陣列中的全部餐廳數量
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell

        // Setting the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocation[indexPath.row]
        cell.typeLabel.text = restaurantType[indexPath.row]
        
        // 被打勾時需顯示此圖示 Exercise2
        cell.heartImageView.isHidden = !restaurantIsVisited[indexPath.row]
        
        // 檢查餐廳是否有被勾選起來
        /*if restaurantIsVisited[indexPath.row] {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }*/
        
        // 上列if可化簡為
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
        return cell
    }
// MARK: - UITableViewDelegate Methods
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // 建立一個選單作為動作清單
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//
//        // For iPad setting 彈出矩形視窗
//        if let popoverController = optionMenu.popoverPresentationController {
//            if let cell = tableView.cellForRow(at: indexPath) {
//                popoverController.sourceView = cell
//                popoverController.sourceRect = cell.bounds
//            }
//        }
//
//        // 加入動作至選單中
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//
//        // 加入打電話動作
//        let callActionHandler = { (action:UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//
//
//        // 加入打卡動作 判斷是否已打勾，若尚未打勾顯示check in，若已打勾則顯示Cancel check in
//        if !restaurantIsVisited[indexPath.row] {
//            let checkInAction = UIAlertAction(title: "Check in", style: .default, handler: {
//            (action:UIAlertAction!) -> Void in
//
//            // 使用indexPath來取得所選取的表格Cell以及所選Cell的索引值
//            //let cell = tableView.cellForRow(at: indexPath)
//            //    cell?.accessoryType = .checkmark
//
//            // 此為ch10_exercise2 solution 選擇性向下轉型(as?) 轉換為RestaurantTableViewCell型態
//            let cell = tableView.cellForRow(at: indexPath) as? RestaurantTableViewCell
//                cell?.heartImageView.isHidden = self.restaurantIsVisited[indexPath.row]
//            // 存取該餐廳已被勾選
//            self.restaurantIsVisited[indexPath.row] = true
//            })
//            optionMenu.addAction(checkInAction)
//        } else {
//            let checkInCancelAction = UIAlertAction(title: "Undo Check in", style: .default, handler: {
//            (action:UIAlertAction!) -> Void in
//
//            //let cell = tableView.cellForRow(at: indexPath)
//            //    cell?.accessoryType = .none
//            let cell = tableView.cellForRow(at: indexPath) as? RestaurantTableViewCell
//                cell?.heartImageView.isHidden = self.restaurantIsVisited[indexPath.row]
//            // 存取該餐廳已取消勾選
//            self.restaurantIsVisited[indexPath.row] = false
//            })
//            optionMenu.addAction(checkInCancelAction)
//        }
//
//
//        // 呈現選單
//        present(optionMenu, animated: true, completion: nil)
//
//        // 取消列的選取
//        tableView.deselectRow(at: indexPath, animated: false)
//    }
//
//    /*
//    // 新增左滑一列時出現Delete按鈕
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        // 從資料模型將資料刪除
//        if editingStyle == .delete {
//            restaurantType.remove(at: indexPath.row)
//            restaurantIsVisited.remove(at: indexPath.row)
//            restaurantNames.remove(at: indexPath.row)
//            restaurantImages.remove(at: indexPath.row)
//            restaurantLocation.remove(at: indexPath.row)
//        }
//
//        // reload 方法一
//        // tableView.reloadData()
//
//        // reload 方法二 第一個參數為索引路徑的陣列，第二個參數為動畫類型
//        tableView.deleteRows(at: [indexPath], with: .fade)
//
//        print("Total item: \(restaurantNames.count)")
//        for name in restaurantNames {
//            print(name)
//        }
//    }
//    */
    
    // 重建Delete功能以及加上一個Share按鈕，使用被定義在UITableViewDelegate的方法
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
        
            // 從資料來源刪除列
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocation.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            self.restaurantType.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            // 呼叫完成處理器來取消動作按鈕
            completionHandler(true)
            
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            let defaultText = "Just checking in at" + self.restaurantNames[indexPath.row]
            let activityController: UIActivityViewController
            
            // if let 用於確認UIImage(Optional)是否有值
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            // For iPad setting 彈出矩形視窗
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            // 呈現畫面
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(systemName: "trash")
        
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        
        // 以UIContextualAction物件的陣列，回傳一個UISwipeActionsConfiguration的物件
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeConfiguration
        
    }
    
    // ch11 exercise
    // add right swipe to check in or cancel check in
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let checkinAction = UIContextualAction(style: .normal, title: "check in") { (action, sourceView, completionHandler) in
            // 此為ch10_exercise2 solution 選擇性向下轉型(as?) 轉換為RestaurantTableViewCell型態
            let cell = tableView.cellForRow(at: indexPath) as? RestaurantTableViewCell
                cell?.heartImageView.isHidden = self.restaurantIsVisited[indexPath.row]
            // 存取該餐廳已被勾選
            self.restaurantIsVisited[indexPath.row] = true
            
            completionHandler(true)
        }
        
        if !self.restaurantIsVisited[indexPath.row] {
            checkinAction.backgroundColor = UIColor(red: 51.0/255.0, green: 212.0/255.0, blue: 149.0/255.0, alpha: 1.0)
            checkinAction.image = UIImage(systemName: "checkmark")
        } else {
            checkinAction.backgroundColor = UIColor(red: 51.0/255.0, green: 212.0/255.0, blue: 149.0/255.0, alpha: 1.0)
            checkinAction.image = UIImage(systemName: "arrow.uturn.left")
        }
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkinAction])
        return swipeConfiguration
        
        
        
    }
    
    // 將資料從傳至RestaurantDetailViewContoller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //檢查識別碼
        if segue.identifier == "showRestaurantDetail" {
            // 取得所選擇的列
            if let indexPath = tableView.indexPathForSelectedRow {
                // 取得目標控制器 此例為RestaurantDetailViewController,因此需向下轉型
                let destinationController = segue.destination as!        RestaurantDetailViewController
                // 將圖片名稱傳至目標控制器
                destinationController.restaurantImageName = restaurantImages[indexPath.row]
                destinationController.restaurantType = restaurantType[indexPath.row]
                destinationController.restaurantName = restaurantNames[indexPath.row]
                destinationController.restaurantLocation = restaurantLocation[indexPath.row]
            }
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
