//
//  Island.swift
//  WarFly
//
//  Created by Andrii Pyvovarov on 2019-11-28.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import SpriteKit
import GameplayKit

final class Island: SKSpriteNode, GameBackgroundSpritable {
    static func populateSpriteAtPoint(at point: CGPoint) -> Island{
        let islandImageName = configureName()
        let island = Island(imageNamed: islandImageName)
        island.setScale(randomScaleFactor)
        island.position = point
        island.zPosition = 1
        island.run(rotateForRandonAngle())
        island.run(move(from: point))
        return island
    }
    fileprivate static func configureName() -> String {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 4)
        let randomNuber = distribution.nextInt()
        let imageName = "is" + "\(randomNuber)"
        return imageName
    }
    fileprivate static var randomScaleFactor: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 10)
        let randomNuber = CGFloat(distribution.nextInt())/10
        return randomNuber
    }
    fileprivate  static func rotateForRandonAngle() -> SKAction {
        let distribution = GKRandomDistribution(lowestValue: 0, highestValue: 360)
        let randomNuber = CGFloat(distribution.nextInt())
        return SKAction.rotate(toAngle: randomNuber * CGFloat(Double.pi/180), duration: 0)
    }
    fileprivate static func move(from point: CGPoint) -> SKAction {
        let movePoint = CGPoint(x: point.x, y: -200)
        let moveDistance = point.y + 200
        let movementSpeed : CGFloat = 10.0
        let duration = moveDistance/movementSpeed
        return SKAction.move(to: movePoint, duration: TimeInterval(duration))
    }
}
