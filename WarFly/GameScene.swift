//
//  GameScene.swift
//  WarFly
//
//  Created by Andrii Pyvovarov on 2019-11-28.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
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
    }
}
