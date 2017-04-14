//
//  GameData.swift
//  CinemaLogic2
//
//  Created by Dmitry Tolmachev on 19.02.17.
//  Copyright © 2017 Dmitry Tolmachev. All rights reserved.
//

import Foundation

class GameData {
    //store the user's game achievement
    var points:Int = 0 {
        didSet {
            //custom setter - keep the score positive
            points = max(points, 0)
        }
    }
}
