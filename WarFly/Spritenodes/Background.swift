//
//  Background.swift
//  WarFly
//
//  Created by Andrii Pyvovarov on 2019-11-28.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import SpriteKit

class Background: SKSpriteNode {
    static func populateBackgrounf(at point: CGPoint) -> Background {
        let background = Background(imageNamed: "background")
        background.position = point
        background.zPosition = 0
        
        return background
    }
}
