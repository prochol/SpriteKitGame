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
    
    private var leftTileMap: SKTileMapNode!
    private var rightTileMap: SKTileMapNode!
    
    private var figure: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        self.setupTileMaps()
        
        let figureSize = SKSpriteNode.baseFigureSize
        
        figure = SKSpriteNode.figureOFill()
        
        figure.scale(to: CGSize(width: figure.size.width * self.leftTileMap.xScale, height: figure.size.height * self.leftTileMap.yScale))
        figure.position = CGPoint(x: self.leftTileMap.position.x - figureSize.width / 2 * self.leftTileMap.xScale, y: self.leftTileMap.position.y - figureSize.height / 2 * self.leftTileMap.yScale)
        self.addChild(figure)
        
        figure = SKSpriteNode.figureJ()
        figure.scale(to: CGSize(width: figure.size.width * self.leftTileMap.xScale, height: figure.size.height * self.leftTileMap.yScale))
        figure.position = CGPoint(x: self.leftTileMap.position.x - figureSize.width * 3 / 2 * self.leftTileMap.xScale, y: self.leftTileMap.position.y + figureSize.height * self.leftTileMap.yScale)
        figure.zRotation = CGFloat.pi
        
        self.addChild(figure)
        
        figure = SKSpriteNode.figureS()
        figure.scale(to: CGSize(width: figure.size.width * self.leftTileMap.yScale, height: figure.size.height * self.leftTileMap.xScale))
        figure.position = CGPoint(x: self.leftTileMap.position.x + figureSize.width * 3 / 2 * self.leftTileMap.xScale, y: self.leftTileMap.position.y)
        figure.zRotation = CGFloat.pi/2
        
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
