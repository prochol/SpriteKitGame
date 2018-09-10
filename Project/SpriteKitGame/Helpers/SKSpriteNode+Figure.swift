//
//  SKSpriteNode+Figure.swift
//  SpriteKitGame
//
//  Created by Kuzmin Pavel on 9/10/18.
//  Copyright © 2018 Kuzmin. All rights reserved.
//

import SpriteKit

extension SKSpriteNode {
    static let baseFigureSize = CGSize.init(width: 128, height: 128)
    
    class func figureIFill() -> SKSpriteNode {
        let figureIFill = SKSpriteNode.init(color: NSColor.lightGray, size: CGSize.init(width: baseFigureSize.width, height: baseFigureSize.height * 4))
        return figureIFill
    }
    
    class func figureIBase() -> SKSpriteNode {
        let figureIBase = SKSpriteNode.init(color: NSColor.clear, size: CGSize.init(width: baseFigureSize.width, height: baseFigureSize.height * 4))
        
        var figure = SKSpriteNode.init(color: NSColor.lightGray, size: baseFigureSize)
        figure.position = CGPoint(x: figureIBase.position.x, y: figureIBase.position.y - baseFigureSize.height * 3 / 2)
        figureIBase.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.lightGray, size: baseFigureSize)
        figure.position = CGPoint(x: figureIBase.position.x, y: figureIBase.position.y - baseFigureSize.height / 2)
        figureIBase.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.lightGray, size: baseFigureSize)
        figure.position = CGPoint(x: figureIBase.position.x, y: figureIBase.position.y + baseFigureSize.height / 2)
        figureIBase.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.lightGray, size: baseFigureSize)
        figure.position = CGPoint(x: figureIBase.position.x, y: figureIBase.position.y + baseFigureSize.height * 3 / 2)
        figureIBase.addChild(figure)
        
        return figureIBase
    }
    
    class func figureOFill() -> SKSpriteNode {
        let figureOFill = SKSpriteNode.init(color: NSColor.blue, size: CGSize.init(width: baseFigureSize.width * 2, height: baseFigureSize.height * 2))
        return figureOFill
    }
    
    class func figureOBase() -> SKSpriteNode {
        let figureOBase = SKSpriteNode.init(color: NSColor.clear, size: CGSize.init(width: baseFigureSize.width * 2, height: baseFigureSize.height * 2))
        
        var figure = SKSpriteNode.init(color: NSColor.blue, size: baseFigureSize)
        figure.position = CGPoint(x: figureOBase.position.x - baseFigureSize.width / 2, y: figureOBase.position.y - baseFigureSize.height / 2)
        figureOBase.addChild(figure)
    
        figure = SKSpriteNode.init(color: NSColor.blue, size: baseFigureSize)
        figure.position = CGPoint(x: figureOBase.position.x - baseFigureSize.width / 2, y: figureOBase.position.y + baseFigureSize.height / 2)
        figureOBase.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.blue, size: baseFigureSize)
        figure.position = CGPoint(x: figureOBase.position.x + baseFigureSize.width / 2, y: figureOBase.position.y + baseFigureSize.height / 2)
        figureOBase.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.blue, size: baseFigureSize)
        figure.position = CGPoint(x: figureOBase.position.x + baseFigureSize.width / 2, y: figureOBase.position.y - baseFigureSize.height / 2)
        figureOBase.addChild(figure)
        
        return figureOBase
    }
    
    class func figureT() -> SKSpriteNode {
        let figureT = SKSpriteNode.init(color: NSColor.clear, size: CGSize.init(width: baseFigureSize.width * 3, height: baseFigureSize.height * 2))
        
        var figure = SKSpriteNode.init(color: NSColor.purple, size: baseFigureSize)
        figure.position = CGPoint(x: figureT.position.x - baseFigureSize.width, y: figureT.position.y + baseFigureSize.height / 2)
        figureT.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.purple, size: baseFigureSize)
        figure.position = CGPoint(x: figureT.position.x, y: figureT.position.y + baseFigureSize.height / 2)
        figureT.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.purple, size: baseFigureSize)
        figure.position = CGPoint(x: figureT.position.x + baseFigureSize.width, y: figureT.position.y + baseFigureSize.height / 2)
        figureT.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.purple, size: baseFigureSize)
        figure.position = CGPoint(x: figureT.position.x, y: figureT.position.y - baseFigureSize.height / 2)
        figureT.addChild(figure)
        
        return figureT
    }
    
    class func figureL() -> SKSpriteNode {
        let figureL = SKSpriteNode.init(color: NSColor.clear, size: CGSize.init(width: baseFigureSize.width * 2, height: baseFigureSize.height * 3))
        
        var figure = SKSpriteNode.init(color: NSColor.brown, size: baseFigureSize)
        figure.position = CGPoint(x: figureL.position.x + baseFigureSize.width / 2, y: figureL.position.y - baseFigureSize.height)
        figureL.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.brown, size: baseFigureSize)
        figure.position = CGPoint(x: figureL.position.x - baseFigureSize.width / 2, y: figureL.position.y - baseFigureSize.height)
        figureL.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.brown, size: baseFigureSize)
        figure.position = CGPoint(x: figureL.position.x - baseFigureSize.width / 2, y: figureL.position.y)
        figureL.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.brown, size: baseFigureSize)
        figure.position = CGPoint(x: figureL.position.x - baseFigureSize.width / 2, y: figureL.position.y + baseFigureSize.height)
        figureL.addChild(figure)
        
        return figureL
    }
    
    class func figureJ() -> SKSpriteNode {
        let figureJ = SKSpriteNode.init(color: NSColor.clear, size: CGSize.init(width: baseFigureSize.width * 2, height: baseFigureSize.height * 3))
        
        var figure = SKSpriteNode.init(color: NSColor.red, size: baseFigureSize)
        figure.position = CGPoint(x: figureJ.position.x - baseFigureSize.width / 2, y: figureJ.position.y - baseFigureSize.height)
        figureJ.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.red, size: baseFigureSize)
        figure.position = CGPoint(x: figureJ.position.x + baseFigureSize.width / 2, y: figureJ.position.y - baseFigureSize.height)
        figureJ.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.red, size: baseFigureSize)
        figure.position = CGPoint(x: figureJ.position.x + baseFigureSize.width / 2, y: figureJ.position.y)
        figureJ.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.red, size: baseFigureSize)
        figure.position = CGPoint(x: figureJ.position.x + baseFigureSize.width / 2, y: figureJ.position.y + baseFigureSize.height)
        figureJ.addChild(figure)
        
        return figureJ
    }
    
    class func figureZ() -> SKSpriteNode {
        let figureZ = SKSpriteNode.init(color: NSColor.clear, size: CGSize.init(width: baseFigureSize.width * 3, height: baseFigureSize.height * 2))
        
        var figure = SKSpriteNode.init(color: NSColor.green, size: baseFigureSize)
        figure.position = CGPoint(x: figureZ.position.x - baseFigureSize.width, y: figureZ.position.y + baseFigureSize.height / 2)
        figureZ.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.green, size: baseFigureSize)
        figure.position = CGPoint(x: figureZ.position.x, y: figureZ.position.y + baseFigureSize.height / 2)
        figureZ.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.green, size: baseFigureSize)
        figure.position = CGPoint(x: figureZ.position.x, y: figureZ.position.y - baseFigureSize.height / 2)
        figureZ.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.green, size: baseFigureSize)
        figure.position = CGPoint(x: figureZ.position.x + baseFigureSize.width, y: figureZ.position.y - baseFigureSize.height / 2)
        figureZ.addChild(figure)
        
        return figureZ
    }
    
    class func figureS() -> SKSpriteNode {
        let figureS = SKSpriteNode.init(color: NSColor.clear, size: CGSize.init(width: baseFigureSize.width * 3, height: baseFigureSize.height * 2))
        
        var figure = SKSpriteNode.init(color: NSColor.yellow, size: baseFigureSize)
        figure.position = CGPoint(x: figureS.position.x, y: figureS.position.y + baseFigureSize.height / 2)
        figureS.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.yellow, size: baseFigureSize)
        figure.position = CGPoint(x: figureS.position.x + baseFigureSize.width, y: figureS.position.y + baseFigureSize.height / 2)
        figureS.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.yellow, size: baseFigureSize)
        figure.position = CGPoint(x: figureS.position.x - baseFigureSize.width, y: figureS.position.y - baseFigureSize.height / 2)
        figureS.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.yellow, size: baseFigureSize)
        figure.position = CGPoint(x: figureS.position.x, y: figureS.position.y - baseFigureSize.height / 2)
        figureS.addChild(figure)
        
        return figureS
    }
}

