//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Mike Sprague on 11/4/14.
//  Copyright (c) 2014 Guidebook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: private properties
    
    // Your data (retrieved from the Interweb)
    private var data : [YourDataModel] = []
    
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        for i in (0...3) {
            let dataModel = YourDataModel()
            dataModel.name = "Test"
            self.data += [dataModel]
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell {
            cell.backgroundColor = UIColor.clearColor()

            let dataModel = self.data[indexPath.row]
            cell.textLabel.text = "Load json text"

            return cell
        }
        // This should never happen:
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }


}

