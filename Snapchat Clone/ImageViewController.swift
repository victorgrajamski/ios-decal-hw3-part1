//
//  ImageViewController.swift
//  Snapchat Clone
//
//  Created by Victor Grajski on 10/16/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var imageToDisplay: UIImageView!
    var snap: Snap?
    
    @IBAction func goBackToOneButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindToImageFeed", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageToDisplay.image = snap?.image
        snap?.setReadStatus(status: true)
        snap?.setInteractionStatus(status: false)
        imageToDisplay.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        imageToDisplay.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGesture() {
        goBackToOneButtonTapped(self)
    }

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationView = segue.destination as? ImageFeedTableViewController {
            destinationView.tableView.reloadData()
        }
    }
    
}
