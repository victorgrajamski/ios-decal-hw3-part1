//
//  SendItTableViewController.swift
//  Snapchat Clone
//
//  Created by Victor Grajski on 10/17/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import UIKit

class SendItTableViewController: UITableViewController {
    @IBOutlet var sendItTable: UITableView!
    
    var imageToSend: UIImage?
    @IBOutlet weak var selectedThreadName: UILabel!
    
    @IBAction func sendIt(_ sender: UIButton) {
        // add selected image to threads
        let newSnap = Snap(name: "Victor Grajski", image: imageToSend!)
        threads[selectedThreadName.text!]!.append(newSnap)
        let alertController = UIAlertController(title: "Meep", message: "Snap posted to \(selectedThreadName.text!)!", preferredStyle: .alert)
        let action3 = UIAlertAction(title: "Meep", style: .cancel) { (action:UIAlertAction) in}
        alertController.addAction(action3)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        selectedThreadName.text = ""
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return threadNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath)
        
        let threadText = threadNames[indexPath.item]
        cell.textLabel?.text = threadText
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedThreadName.text = threadNames[indexPath.item]
    }
}
