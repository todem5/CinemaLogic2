//
//  Config.swift
//  CinemaLogic2
//
//  Created by Dmitry Tolmachev on 19.02.17.
//  Copyright © 2017 Dmitry Tolmachev. All rights reserved.
//

import Foundation
import UIKit

//UI Constants
let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

//Random number generator
func randomNumber(minX:UInt32, maxX:UInt32) -> Int {
    let result = (arc4random() % (maxX - minX + 1)) + minX
    return Int(Int(result))
}

let TileMargin: CGFloat = 20.0

let FontHUD = UIFont(name:"Arial", size: 60.0)!
let FontHUDBig = UIFont(name:"Arial", size: 100.0)!

// Sound effects
let SoundDing = "ding.mp3"
let SoundWrong = "wrong.m4a"
let SoundWin = "win.mp3"
let AudioEffectFiles = [SoundDing, SoundWrong, SoundWin]
