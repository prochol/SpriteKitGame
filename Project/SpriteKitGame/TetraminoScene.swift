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
    
    private var selectedFigure: SKSpriteNode?
    
    private var mapScale: CGPoint!
    
    override func didMove(to view: SKView) {
        self.setupTileMaps()
        self.mapScale = CGPoint.init(x: self.leftTileMap.xScale, y: self.leftTileMap.yScale)
        let figureSize = SKSpriteNode.kBaseFigureSize
        
        var figure = SKSpriteNode.figureOFill()
        
        figure.scale(to: CGSize(width: figure.size.width * mapScale.x, height: figure.size.height * mapScale.y))
        figure.position = CGPoint(x: self.leftTileMap.position.x - figureSize.width / 2 * self.leftTileMap.xScale, y: self.leftTileMap.position.y - figureSize.height / 2 * self.leftTileMap.yScale)
        self.addChild(figure)
        
        figure = SKSpriteNode.figureJ()
        figure.scale(to: CGSize(width: figure.size.width *  mapScale.x, height: figure.size.height * mapScale.y))
        figure.position = CGPoint(x: self.leftTileMap.position.x - figureSize.width * 3 / 2 * self.leftTileMap.xScale, y: self.leftTileMap.position.y + figureSize.height * self.leftTileMap.yScale)
        figure.zRotation = CGFloat.pi
        
        self.addChild(figure)
        
        figure = SKSpriteNode.figureS()
        figure.scale(to: CGSize(width: figure.size.width * mapScale.y, height: figure.size.height *  mapScale.x))
        figure.position = CGPoint(x: self.leftTileMap.position.x + figureSize.width * 3 / 2 * self.leftTileMap.xScale, y: self.leftTileMap.position.y)
        figure.zRotation = CGFloat.pi/2
        
        self.addChild(figure)
    }
    
    override func mouseDown(with event: NSEvent) {
         self.touchDown(at: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(to: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(at: event.location(in: self))
    }
    
    // MARK: - private functions
    
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
    
    private func touchDown(at point: CGPoint) {
        for figure in self.children {
            if figure is SKSpriteNode && figure.contains(point) {
                self.selectedFigure = figure as? SKSpriteNode
            }
        }
        
        self.selectedFigure?.zPosition = 1
        if let selectedSize = self.selectedFigure?.size {
            self.selectedFigure?.scale(to: CGSize(width: selectedSize.width * 1.25, height: selectedSize.height * 1.25))
        }
    }
    
    private func touchMoved(to point: CGPoint) {
        self.selectedFigure?.position = point
    }
    
    private func touchUp(at point: CGPoint) {
        if let selectedSize = self.selectedFigure?.size {
            self.selectedFigure?.scale(to: CGSize(width: selectedSize.width * 0.8, height: selectedSize.height * 0.8))
        }
        self.selectedFigure?.zPosition = 0
        
        self.selectedFigure = nil
    }
}
