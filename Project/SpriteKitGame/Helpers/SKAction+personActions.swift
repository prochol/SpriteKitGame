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

    class func getTurnInAction() -> SKAction {
        let textures: [SKTexture] = SKTexture.turnInActionTextures
        return SKAction.animate(with: textures, timePerFrame: SKAction.timePerFrame)
    }

    class func getTurnOutAction() -> SKAction {
        let textures: [SKTexture] = SKTexture.turnOutActionTextures
        return SKAction.animate(with: textures, timePerFrame: SKAction.timePerFrame)
    }

    class func getWalkAction() -> SKAction {
        let textures: [SKTexture] = SKTexture.walkActionTextures
        return SKAction.animate(with: textures, timePerFrame: SKAction.timePerFrame)
    }
}
