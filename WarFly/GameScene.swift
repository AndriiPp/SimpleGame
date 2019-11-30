//
//  GameScene.swift
//  WarFly
//
//  Created by Andrii Pyvovarov on 2019-11-28.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    var player: SKSpriteNode!
    let motionManager = CMMotionManager()
    var xAcceleretion: CGFloat = 0
    override func didMove(to view: SKView) {
        let screenCenterPont = CGPoint(x: self.size.width/2, y: self.size.height/2)
        let background = Background.populateBackgrounf(at: screenCenterPont)
        background.size = self.size
        self.addChild(background)
        
        let screen = UIScreen.main.bounds
        for _ in 1...5 {
            let x: CGFloat = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: Int(screen.size.width)))
            let y: CGFloat = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: Int(screen.size.height)))
            let island = Island.populateSpriteAtPoint(at: CGPoint(x: x, y: y))
            self.addChild(island)
            
            let cloud = Cloud.populateSpriteAtPoint(at: CGPoint(x: x, y: y))
            self.addChild(cloud)
        }
        player = PlayerPlane.populate(at: CGPoint(x: screen.size.width/2, y: 100))
        self.addChild(player)
        
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, err) in
            if let data = data {
                let acceleration = data.acceleration
                self.xAcceleretion = CGFloat(acceleration.x * 0.7) + self.xAcceleretion*0.3
            }
        }
    }
    override func didSimulatePhysics() {
        super.didSimulatePhysics()
        player.position.x  += xAcceleretion + 50
        if player.position.x < -70 {
            player.position.x = self.size.width + 70
        } else if player.position.x > self.size.width + 70 {
            player.position.x = -70
        }
    }
}
