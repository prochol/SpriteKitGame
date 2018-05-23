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

    static var turnInActionTextures: [SKTexture] {
        return turnImages.map { SKTexture(image: $0) }
    }

    static var turnOutActionTextures: [SKTexture] {
        let images = turnImages.makeIterator().reversed()
        return images.map { SKTexture(image: $0) }
    }

    static var walkActionTextures: [SKTexture] {
        return walkImages.map { SKTexture(image: $0) }
    }
}
