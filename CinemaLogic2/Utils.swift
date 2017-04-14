//
//  Utils.swift
//  CinemaLogic2
//
//  Created by Dmitry Tolmachev on 22.01.17.
//  Copyright © 2017 Dmitry Tolmachev. All rights reserved.
//

import Foundation
import CoreGraphics

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x+right.x, y: left.y+right.y)
}

func * (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x*right.x, y: left.y*right.y)
}

//func countLevels() -> Int {
//    let name: String
//    let descript: String
//    
//    init(levelNumber: Int) {
//        //1 find .plist file for this level
//        let fileName = "level\(levelNumber).plist"
//        let levelPath = "\(Bundle.main.resourcePath!)/\(fileName)"
//        //2 load .plist file
//        let levelDictionary: NSDictionary? = NSDictionary(contentsOfFile: levelPath)
//        //3 validation
//        assert(levelDictionary != nil, "Level configuration file not found")
//        //4 initialize the object from the dictionary
//        self.name = levelDictionary!["name"] as! String
//        self.descript = levelDictionary!["descript"] as! String
//    }
//}
