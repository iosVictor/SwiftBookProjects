//
//  Background.swift
//  WarFly
//
//  Created by Victor Kimpel on 21.04.23.
//

import SpriteKit

class Background: SKSpriteNode {

    static func populateBackground(at point: CGPoint) -> Background {
        
        let background = Background(imageNamed: "background")
        background.position = point
        background.zPosition = 0
        
        return background
    }
}
