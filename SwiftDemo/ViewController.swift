//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Mike Sprague on 11/4/14.
//  Copyright (c) 2014 Guidebook. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: private properties
    
    // Your data (retrieved from the Interweb)
    private var data : [YourDataModel] = []
    private let url = "http://guidebook.com/service/v2/upcomingGuides/"
    
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        Alamofire.request(.GET, url)
            .responseJSON { (_, _, json, _) in
                
                let test = JSON(json!)
                self.data = test["data"].arrayValue.map { dict in
                    let dataModel = YourDataModel()
                    dataModel.name = dict["name"].stringValue
                    return dataModel
                }

                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell {
            cell.backgroundColor = UIColor.clearColor()

            let dataModel = self.data[indexPath.row]
            cell.textLabel.text = dataModel.name

            return cell
        }
        // This should never happen:
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }


}

