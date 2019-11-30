//
//  PlayerPlane.swift
//  WarFly
//
//  Created by Andrii Pyvovarov on 2019-11-28.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import SpriteKit

class PlayerPlane: SKSpriteNode {
    static func populate(at Point: CGPoint) -> SKSpriteNode{
        let playerPlaneTexture = SKTexture(imageNamed: "airplane_3ver2_13")
        let playerPlane = SKSpriteNode(texture: playerPlaneTexture)
        playerPlane.setScale(0.5)
        playerPlane.position = Point
        playerPlane.zPosition = 20
        return playerPlane
    }
}
