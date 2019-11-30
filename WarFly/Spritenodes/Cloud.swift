//
//  Cloud.swift
//  WarFly
//
//  Created by Andrii Pyvovarov on 2019-11-28.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import SpriteKit
import GameplayKit

protocol GameBackgroundSpritable {
     static func populateSpriteAtPoint(at point: CGPoint) -> Self
}

final class Cloud: SKSpriteNode, GameBackgroundSpritable {
    static func populateSpriteAtPoint(at point: CGPoint) -> Cloud{
        let cloudImageName = configureName()
        let cloud = Cloud(imageNamed: cloudImageName)
        cloud.setScale(randomScaleFactor)
        cloud.position = point
        cloud.zPosition = randomScaleCloud
        cloud.run(move(from: point))
        return cloud
    }
    fileprivate static func configureName() -> String {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 3)
        let randomNuber = distribution.nextInt()
        let imageName = "cl" + "\(randomNuber)"
        return imageName
    }
    fileprivate static var randomScaleFactor: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 20, highestValue: 30)
        let randomNuber = CGFloat(distribution.nextInt())/10
        return randomNuber
    }
    fileprivate static var randomScaleCloud: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 18, highestValue: 22)
        let randomNuber = CGFloat(distribution.nextInt())
        return randomNuber
    }
    fileprivate static func move(from point: CGPoint) -> SKAction {
        let movePoint = CGPoint(x: point.x, y: -200)
        let moveDistance = point.y + 200
        let movementSpeed : CGFloat = 15.0
        let duration = moveDistance/movementSpeed
        return SKAction.move(to: movePoint, duration: TimeInterval(duration))
    }
}
