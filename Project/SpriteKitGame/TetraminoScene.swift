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
        self.setupFigures()
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

    private func setupFigures() {
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

    private func touchDown(at point: CGPoint) {
        for figure in self.children {
            if figure is FigureNode && figure.contains(point) {
                self.selectedFigure = figure as? FigureNode
            }
        }
        
        if let selectedFigure = self.selectedFigure {
            self.selectedOfset = CGPoint.init(x: selectedFigure.position.x - point.x, y: selectedFigure.position.y - point.y)
            
            selectedFigure.zPosition = 1
            
//            let selectedSize = selectedFigure.size
            selectedFigure.run(SKAction.scale(by: 1.2, duration: 0.07)) {
                selectedFigure.run(SKAction.scale(by: 1.125/1.2, duration: 0.1))
//                selectedFigure.scale(to: CGSize(width: selectedSize.width * 1.125, height: selectedSize.height * 1.125))
            }
        }
    }
    
    private func touchMoved(to point: CGPoint) {
        self.selectedFigure?.position = CGPoint.init(x: point.x + self.selectedOfset!.x, y: point.y + self.selectedOfset!.y)
    }
    
    private func touchUp(at point: CGPoint) {
        if let selectedFigure = self.selectedFigure {
            let selectedSize = selectedFigure.size
            selectedFigure.scale(to: CGSize(width: selectedSize.width * 8/9, height: selectedSize.height * 8/9))
            
            let selectedFigurePositionLeft = self.convert(selectedFigure.position, to: self.leftTileMap)
            let selectedFigurePositionRight = self.convert(selectedFigure.position, to: self.rightTileMap)
            
            var isRight = false
            
            var distance = CGFloat.greatestFiniteMagnitude
            var magnitPoint = self.leftTileMap.centerOfTile(atColumn: 0, row: 0)
            
            for i in 0 ..< self.leftTileMap.numberOfRows {
                for j in 0 ..< self.leftTileMap.numberOfColumns {
                    let centerPoint = self.leftTileMap.centerOfTile(atColumn: i, row: j)
                    let xDist = (centerPoint.x - selectedFigurePositionLeft.x + FigureNode.kBaseFigureSize.width / 2)
                    let yDist = (centerPoint.y - selectedFigurePositionLeft.y)
                    let distanceToCenter = sqrt((xDist * xDist) + (yDist * yDist))
                    
                    if distanceToCenter < distance {
                        distance = distanceToCenter
                        magnitPoint = CGPoint.init(x: centerPoint.x + FigureNode.kBaseFigureSize.width / 2, y: centerPoint.y)
                    }
                }
                
                for j in 0 ..< self.rightTileMap.numberOfColumns {
                    let centerPoint = self.rightTileMap.centerOfTile(atColumn: i, row: j)
                    let xDist = (centerPoint.x - selectedFigurePositionRight.x + FigureNode.kBaseFigureSize.width / 2)
                    let yDist = (centerPoint.y - selectedFigurePositionRight.y)
                    let distanceToCenter = sqrt((xDist * xDist) + (yDist * yDist))
                    
                    if distanceToCenter < distance {
                        distance = distanceToCenter
                        magnitPoint = CGPoint.init(x: centerPoint.x + FigureNode.kBaseFigureSize.width / 2, y: centerPoint.y)
                        isRight = true
                    }
                }
            }
            
            selectedFigure.position = isRight ? self.rightTileMap.convert(magnitPoint, to: self) : self.leftTileMap.convert(magnitPoint, to: self)
            selectedFigure.zPosition = 0
            
            self.selectedOfset = nil
            self.selectedFigure = nil
        }
    }
}
