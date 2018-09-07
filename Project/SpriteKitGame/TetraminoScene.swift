//
//  TetraminoScene.swift
//  SpriteKitGame
//
//  Created by Kuzmin Pavel on 9/7/18.
//  Copyright © 2018 Kuzmin. All rights reserved.
//

import SpriteKit
import GameplayKit

class TetraminoScene: SKScene {
    
    private let figureTexture: SKTexture = SKTexture(imageNamed: "Water_Grid_Center")
    
    private var leftTileMap: SKTileMapNode!
    private var rightTileMap: SKTileMapNode!
    
    private var figure: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        self.setupTileMaps()
        
        figure = SKSpriteNode(texture: figureTexture)
        
    }
    
    private func setupTileMaps() {
        self.setupLeftTileMap()
        self.setupRightTileMap()
    }
    
    private func setupLeftTileMap() {
        self.leftTileMap = self.childNode(withName: "//Left Tile Map") as? SKTileMapNode
        leftTileMap.color = NSColor.blue
    }
    
    private func setupRightTileMap() {
        self.rightTileMap = self.childNode(withName: "//Right Tile Map") as? SKTileMapNode
        rightTileMap.color = NSColor.red
    }
}
