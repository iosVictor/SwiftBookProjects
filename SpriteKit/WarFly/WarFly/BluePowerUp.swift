//
//  BluePowerUp.swift
//  WarFly
//
//  Created by Victor Kimpel on 7.05.23.
//

import SpriteKit

class BluePowerUp: PowerUp {
    
    init() {
        let textureAtlas = SKTextureAtlas(named: "BluePowerUp")
        super.init(textureAtlas: textureAtlas)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
