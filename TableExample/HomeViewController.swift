//
//  HomeViewController.swift
//  TableExample
//
//  Created by Gleb on 09.04.17.
//  Copyright © 2017 Example. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView111: UITableView!
    
    var itemsArray: [[String: Any]] = [[:]]
    var valueToPass : String!
    var audioArray: [[Any]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView111.delegate = self
        self.tableView111.dataSource = self
        self.tableView111.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var requestInfo = RequestInfo()
        requestInfo.method = "search"
        requestInfo.query = "caliban"
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        API2Client.shared.audio(requestInfo: requestInfo) { (response, success, error) in
            hud.hide(animated: true)
            if success {
                if let response = response {
                    if let list = response.list {
                        self.audioArray = list
                        self.tableView111.reloadData()
                    }
                }
            } else {
                print(error)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.audioArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! HomeTableViewCell
        
        var dict = self.audioArray[indexPath.row]
        if dict.count > 0 {
            let name = dict[3] as? String
            let group = dict[4] as? String
            if let name = name, let group = group {
                cell.titleLable.text = group + " - " + name
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let dict = itemsArray[indexPath.row]
//        let viewController = DetailHomeViewController.self.initWithNib()
//        (viewController as? DetailHomeViewController)?.dictionary = dict
//        self.navigationController?.pushViewController(viewController, animated: true)
        
        var dict = self.audioArray[indexPath.row]
        let id1 = dict[1] as? Int
        let id2 = dict[0] as? Int
        
        var requestInfo = RequestInfo()
        requestInfo.method = "get.audio"
        if let id1 = id1, let id2 = id2 {
            requestInfo.ids = String(describing: id1) + "_" + String(describing: id2)
        }
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        API2Client.shared.getAudio(requestInfo: requestInfo) { (response, success, error) in
            hud.hide(animated: true)
            if success {
                if let response = response {
                    if let list = response.item {
                        print(list[3])
                    }
                }
            } else {
                print(error)
            }
        }
    }
}
