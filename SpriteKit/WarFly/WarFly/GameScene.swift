//
//  GameScene.swift
//  WarFly
//
//  Created by Victor Kimpel on 19.04.23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
 
    override func didMove(to view: SKView) {
        
        let screenCenterPoint = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        let background = Background.populateBackground(at: screenCenterPoint)
        background.size = self.size
        self.addChild(background)
    }
}
