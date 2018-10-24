//
//  ImageFeedTableViewController.swift
//  Snapchat Clone
//
//  Created by Victor Grajski on 10/22/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import UIKit

class ImageFeedTableViewController: UITableViewController {
    
    
    var selectedIndexPath: IndexPath?
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return threadNames.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (threads[threadNames[section]]?.count)!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postReuseIdentifier", for: indexPath) as! ImageFeedTableViewCell
        
        let snap = threads[threadNames[indexPath.section]]![indexPath.item]
        
        cell.isUserInteractionEnabled = snap.getInteractionStatus()
        
        cell.statusImage.image = snap.getStatusImage()
        
        cell.nameLabel.text = snap.getName()
        
        if snap.getReadTime() != nil {
            cell.timeAgoLabel.text = NSString(format: "%.0fs", snap.calculateReadTimeDiff()!) as String
        }
        else {
            cell.timeAgoLabel.text = NSString(format: "%.0fs", snap.calculatePostTimeDiff()) as String
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let imageRow = tableView.dequeueReusableCell(withIdentifier: "postReuseIdentifier", for: indexPath) as? ImageFeedTableViewCell {
            selectedIndexPath = indexPath
            performSegue(withIdentifier: "viewFullImage", sender: imageRow)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationView = segue.destination as? ImageViewController {
            destinationView.snap = threads[threadNames[(selectedIndexPath?.section)!]]![(selectedIndexPath?.item)!]
        }
    }
}
