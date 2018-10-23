//
//  Snap.swift
//  Snapchat Clone
//
//  Created by Victor Grajski on 10/22/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class Snap {
    var readStatus: Bool
    var name: String
    var timePosted: String
    var statusImage: UIImage
    var image: UIImage
    var interactionStatus: Bool
    
    init(name: String, image: UIImage) {
        readStatus = false
        self.name = name
        self.statusImage = UIImage(named: "unread")!
        self.image = image
        self.interactionStatus = true
        
        // https://stackoverflow.com/questions/42524651/convert-nsdate-to-string-in-ios-swift
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: Date()) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MMM-yyyy"
        // again convert your date to string
        timePosted = formatter.string(from: yourDate!)
    }
    
    func setReadStatus(status: Bool) {
        self.readStatus = status
        setStatusImage(readStatus: status)
    }
    
    func setInteractionStatus(status: Bool) {
        self.interactionStatus = status
    }
    
    func setStatusImage(readStatus: Bool) {
        if !readStatus {
            self.statusImage = UIImage(named: "unread")!
        }
        else {
            self.statusImage = UIImage(named: "read")!
        }
    }
    
    
}
