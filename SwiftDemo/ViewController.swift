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
        
        // get request for our json
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        Alamofire.request(.GET, url).responseJSON { (_, _, json, error) in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            if let unwrappedJson: AnyObject = json {
                let jsonData = JSON(unwrappedJson)
                
                // Go through the json dict's "data" value (which is an array)
                // and read each element as a dictionary, then parse it into your data model.
                self.data = jsonData["data"].arrayValue.map { jsonDict in
                    YourDataModel(jsonData: jsonDict)
                }
                
                // Run reloadData on main thread to ensure UI updates
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }
            } else {
                UIAlertView(title: "Error!", message: "\(error)", delegate: nil, cancelButtonTitle: "Okay :(").show()
            }
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell {

            let dataModel = self.data[indexPath.row]
            cell.textLabel.text = dataModel.name
            cell.backgroundColor = UIColor.clearColor()

            return cell
        }
        
        // This should never happen, as long as the reuse identifier was properly set in the storyboard:
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

