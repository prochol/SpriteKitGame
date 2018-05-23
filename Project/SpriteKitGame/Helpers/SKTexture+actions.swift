//
// SKTexture+actions.swift
// SpriteKitGame
//
// Created by Kuzmin Pavel on 5/23/18.
// Copyright © 2018 Kuzmin. All rights reserved.
//

import SpriteKit

extension SKTexture {

    private static let idleImages = [#imageLiteral(resourceName: "idle_1"),
                                     #imageLiteral(resourceName: "idle_2"),
                                     #imageLiteral(resourceName: "idle_3")]

    private static let turnImages = [#imageLiteral(resourceName: "turn_1"),
                                       #imageLiteral(resourceName: "turn_2"),
                                       #imageLiteral(resourceName: "turn_3")]

    private static let walkImages = [#imageLiteral(resourceName: "walk_1"),
                                     #imageLiteral(resourceName: "walk_2"),
                                     #imageLiteral(resourceName: "walk_3"),
                                     #imageLiteral(resourceName: "walk_4"),
                                     #imageLiteral(resourceName: "walk_5"),
                                     #imageLiteral(resourceName: "walk_6")]


    class func idleActionTextures() -> [SKTexture] {
        return [SKTexture(image: idleImages.first!),
                SKTexture(image: idleImages[1]),
                SKTexture(image: idleImages.last!),
                SKTexture(image: idleImages[1]),
                SKTexture(image: idleImages.first!)]
    }

    class func turnInActionTextures() -> [SKTexture] {
        return [SKTexture(image: turnImages.first!),
                SKTexture(image:turnImages[1]),
                SKTexture(image: turnImages.last!)]
    }

    class func turnOutActionTextures() -> [SKTexture] {
        return [SKTexture(image: turnImages.last!),
                SKTexture(image: turnImages[1]),
                SKTexture(image: turnImages.first!)]
    }

    class func walkActionTextures() -> [SKTexture] {
        return [SKTexture(image: walkImages.first!),
                SKTexture(image: walkImages[1]),
                SKTexture(image: walkImages[2]),
                SKTexture(image: walkImages[3]),
                SKTexture(image: walkImages[4]),
                SKTexture(image: walkImages.last!)]
    }
}
