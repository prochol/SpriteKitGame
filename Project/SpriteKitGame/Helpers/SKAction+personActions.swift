//
// SKAction+personActions.swift
// SpriteKitGame
//
// Created by Kuzmin Pavel on 5/23/18.
// Copyright © 2018 Kuzmin. All rights reserved.
//

import SpriteKit

extension SKAction {

    private static let timePerFrame = 0.05

    class func getIdleAction() -> SKAction {
        let textures: [SKTexture] = SKTexture.idleActionTextures
        return SKAction.animate(with: textures, timePerFrame: SKAction.timePerFrame)
    }

    class func getTurnInLeftAction() -> SKAction {
        let textures: [SKTexture] = SKTexture.turnInLeftActionTextures
        return SKAction.animate(with: textures, timePerFrame: SKAction.timePerFrame)
    }
    
    class func getTurnOutLeftAction() -> SKAction {
        let textures: [SKTexture] = SKTexture.turnOutLeftActionTextures
        return SKAction.animate(with: textures, timePerFrame: SKAction.timePerFrame)
    }
    
    class func getTurnInRightAction() -> SKAction {
        let textures: [SKTexture] = SKTexture.turnInRightActionTextures
        return SKAction.animate(with: textures, timePerFrame: SKAction.timePerFrame)
    }

    class func getTurnOutRightAction() -> SKAction {
        let textures: [SKTexture] = SKTexture.turnOutRightActionTextures
        return SKAction.animate(with: textures, timePerFrame: SKAction.timePerFrame)
    }

    class func getWalkLeftAction() -> SKAction {
        let textures: [SKTexture] = SKTexture.walkLeftActionTextures
        return SKAction.animate(with: textures, timePerFrame: SKAction.timePerFrame)
    }

    class func getWalkRightAction() -> SKAction {
        let textures: [SKTexture] = SKTexture.walkRightActionTextures
        return SKAction.animate(with: textures, timePerFrame: SKAction.timePerFrame)
    }
}
