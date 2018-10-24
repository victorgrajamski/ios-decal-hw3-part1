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
    private var readStatus: Bool
    private var name: String
    private var timePosted: Date
    private var statusImage: UIImage
    private var image: UIImage
    private var interactionStatus: Bool
    private var readTime: Date?
    private var timeDiff: TimeInterval?
    private var postTimeDiff: TimeInterval
    
    init(name: String, image: UIImage) {
        self.readStatus = false
        self.name = name
        self.statusImage = UIImage(named: "unread")!
        self.image = image
        self.interactionStatus = true
        self.timePosted = Date()
        self.readTime = nil
        self.timeDiff = nil
        self.postTimeDiff = 0.0
        self.setPostTimeDiff()
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
    
    func setReadTime(readTime: Date) {
        self.readTime = readTime
        self.setTimeDiff(readTime: (self.readTime?.timeIntervalSince(self.timePosted))!)
    }
    
    func setTimeDiff(readTime: TimeInterval) {
        let currentTime = Date()
        self.timeDiff = currentTime.timeIntervalSince(self.timePosted).rounded()
    }
    
    func calculateReadTimeDiff() -> Double? {
        let currentTime = Date()
        self.timeDiff = currentTime.timeIntervalSince(self.readTime!).rounded()
        return self.timeDiff
    }
    
    func setPostTimeDiff() {
        let currentTime = Date()
        self.postTimeDiff = currentTime.timeIntervalSince(self.timePosted).rounded()
    }
    
    func calculatePostTimeDiff() -> Double {
        let currentTime = Date()
        self.postTimeDiff = currentTime.timeIntervalSince(self.timePosted).rounded()
        return self.postTimeDiff
    }
    
    func getInteractionStatus() -> Bool {
        return self.interactionStatus
    }
    
    func getStatusImage() -> UIImage {
        return self.statusImage
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getReadTime() -> Date? {
        return self.readTime
    }
    
    func getImage() -> UIImage {
        return self.image
    }
}
