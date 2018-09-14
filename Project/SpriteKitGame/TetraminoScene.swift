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
    
    private var selectedFigure: FigureNode?
    private var selectedOfset: CGPoint?
    
    private var mapScale: CGPoint!
    
    override func didMove(to view: SKView) {
        self.setupTileMaps()
        self.mapScale = CGPoint.init(x: self.leftTileMap.xScale, y: self.leftTileMap.yScale)
        let figureSize = FigureNode.kBaseFigureSize
        
        var figure = FigureNode.figureOFill()
        figure.scale(to: CGSize(width: figure.size.width * mapScale.x, height: figure.size.height * mapScale.y))
        figure.position = CGPoint(x: self.leftTileMap.position.x - figureSize.width / 2 * mapScale.x, y: self.leftTileMap.position.y - figureSize.height / 2 * mapScale.y)
        self.addChild(figure)
        
        figure = FigureNode.figureJ()
        figure.scale(to: CGSize(width: figure.size.width * mapScale.x, height: figure.size.height * mapScale.y))
        figure.position = CGPoint(x: self.leftTileMap.position.x - figureSize.width * 3 / 2 * mapScale.x, y: self.leftTileMap.position.y + figureSize.height * mapScale.y)
        figure.zRotation = CGFloat.pi
        self.addChild(figure)
        
        figure = FigureNode.figureS()
        figure.scale(to: CGSize(width: figure.size.width * mapScale.y, height: figure.size.height * mapScale.x))
        figure.position = CGPoint(x: self.leftTileMap.position.x + figureSize.width * 3 / 2 * mapScale.x, y: self.leftTileMap.position.y)
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
            if figure is FigureNode && figure.contains(point) {
                self.selectedFigure = figure as? FigureNode
            }
        }
        
        if let selectedFigure = self.selectedFigure {
            self.selectedOfset = CGPoint.init(x: selectedFigure.position.x - point.x, y: selectedFigure.position.y - point.y)
            
            selectedFigure.zPosition = 1
            
            let selectedSize = selectedFigure.size
            selectedFigure.scale(to: CGSize(width: selectedSize.width * 1.25, height: selectedSize.height * 1.25))
        }
    }
    
    private func touchMoved(to point: CGPoint) {
        self.selectedFigure?.position = CGPoint.init(x: point.x + self.selectedOfset!.x, y: point.y + self.selectedOfset!.y)
    }
    
    private func touchUp(at point: CGPoint) {
        if let selectedFigure = self.selectedFigure {
            let selectedSize = selectedFigure.size
            selectedFigure.scale(to: CGSize(width: selectedSize.width * 0.8, height: selectedSize.height * 0.8))
            
            selectedFigure.zPosition = 0
            
            self.selectedOfset = nil
            self.selectedFigure = nil
        }
    }
}
