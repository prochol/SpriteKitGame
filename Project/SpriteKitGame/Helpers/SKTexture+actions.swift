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

    private static let turnLeftImages = [#imageLiteral(resourceName: "turnLeft_1"),
                                         #imageLiteral(resourceName: "turnLeft_2"),
                                         #imageLiteral(resourceName: "turnLeft_3")]
    
    private static let turnRightImages = [#imageLiteral(resourceName: "turnRight_1"),
                                          #imageLiteral(resourceName: "turnRight_2"),
                                          #imageLiteral(resourceName: "turnRight_3")]

    private static let walkLeftImages = [#imageLiteral(resourceName: "walkLeft_1"),
                                         #imageLiteral(resourceName: "walkLeft_2"),
                                         #imageLiteral(resourceName: "walkLeft_3"),
                                         #imageLiteral(resourceName: "walkLeft_4"),
                                         #imageLiteral(resourceName: "walkLeft_5"),
                                         #imageLiteral(resourceName: "walkLeft_6")]

    private static let walkRightImages = [#imageLiteral(resourceName: "walkRight_1"),
                                          #imageLiteral(resourceName: "walkRight_2"),
                                          #imageLiteral(resourceName: "walkRight_3"),
                                          #imageLiteral(resourceName: "walkRight_4"),
                                          #imageLiteral(resourceName: "walkRight_5"),
                                          #imageLiteral(resourceName: "walkRight_6")]

    static var idleActionTextures: [SKTexture] {
        var images = [NSImage]()
        var imagesNextIterator = idleImages.makeIterator()
        var imagesReversedIterator = imagesNextIterator.reversed().makeIterator()
        while let image = imagesNextIterator.next() {
            images.append(image)
        }
        while let image = imagesReversedIterator.next() {
            if image != images.last {
                images.append(image)
            }
        }

        return images.map { SKTexture(image: $0) }
    }

    static var turnInLeftActionTextures: [SKTexture] {
        return turnLeftImages.map { SKTexture(image: $0) }
    }

    static var turnOutLeftActionTextures: [SKTexture] {
        let images = turnLeftImages.makeIterator().reversed()
        return images.map { SKTexture(image: $0) }
    }

    static var turnInRightActionTextures: [SKTexture] {
        return turnRightImages.map { SKTexture(image: $0) }
    }

    static var turnOutRightActionTextures: [SKTexture] {
        let images = turnRightImages.makeIterator().reversed()
        return images.map { SKTexture(image: $0) }
    }

    static var walkLeftActionTextures: [SKTexture] {
        return walkLeftImages.map { SKTexture(image: $0) }
    }

    static var walkRightActionTextures: [SKTexture] {
        return walkRightImages.map { SKTexture(image: $0) }
    }
}
