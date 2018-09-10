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
        figure.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        figure.scale(to: CGSize(width: 128 * self.leftTileMap.xScale, height: 128 * self.leftTileMap.yScale))
        figure.position = CGPoint(x: self.leftTileMap.position.x - 128 * figure.xScale, y: self.leftTileMap.position.y)
        self.addChild(figure)
        
        figure = SKSpriteNode(texture: figureTexture)
        figure.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        figure.scale(to: CGSize(width: 128 * self.leftTileMap.xScale, height: 128 * self.leftTileMap.yScale))
        figure.position = CGPoint(x: self.leftTileMap.position.x - 128 * figure.xScale, y: self.leftTileMap.position.y - 128 * figure.yScale)
        self.addChild(figure)
        
        figure = SKSpriteNode(texture: figureTexture)
        figure.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        figure.scale(to: CGSize(width: 128 * self.leftTileMap.xScale, height: 128 * self.leftTileMap.yScale))
        figure.position = CGPoint(x: self.leftTileMap.position.x, y: self.leftTileMap.position.y - 128 * figure.yScale)
        self.addChild(figure)

        figure = SKSpriteNode(texture: figureTexture)
        figure.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        figure.scale(to: CGSize(width: 128 * self.leftTileMap.xScale, height: 128 * self.leftTileMap.yScale))
        figure.position = CGPoint(x: self.leftTileMap.position.x, y: self.leftTileMap.position.y)
        self.addChild(figure)
    }
    
    private func setupTileMaps() {
        self.setupLeftTileMap()
        self.setupRightTileMap()
    }
    
    private func setupLeftTileMap() {
        self.leftTileMap = self.childNode(withName: "//Left Tile Map") as? SKTileMapNode
    }
    
    private func setupRightTileMap() {
        self.rightTileMap = self.childNode(withName: "//Right Tile Map") as? SKTileMapNode
    }
}
