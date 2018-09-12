//
//  FigureNode+Figure.swift
//  SpriteKitGame
//
//  Created by Kuzmin Pavel on 9/10/18.
//  Copyright © 2018 Kuzmin. All rights reserved.
//

import SpriteKit

extension FigureNode {
    static let kBaseFigureSize = CGSize.init(width: 128, height: 128)
    
    class func figureIFill() -> FigureNode {
        let figureIFill = FigureNode.init(color: NSColor.lightGray, size: CGSize.init(width: kBaseFigureSize.width, height: kBaseFigureSize.height * 4))
        return figureIFill
    }
    
    class func figureIBase() -> FigureNode {
        let figureIBase = FigureNode.init(color: NSColor.clear, size: CGSize.init(width: kBaseFigureSize.width, height: kBaseFigureSize.height * 4))
        
        var figure = SKSpriteNode.init(color: NSColor.lightGray, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureIBase.position.x, y: figureIBase.position.y - kBaseFigureSize.height * 3 / 2)
        figureIBase.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.lightGray, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureIBase.position.x, y: figureIBase.position.y - kBaseFigureSize.height / 2)
        figureIBase.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.lightGray, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureIBase.position.x, y: figureIBase.position.y + kBaseFigureSize.height / 2)
        figureIBase.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.lightGray, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureIBase.position.x, y: figureIBase.position.y + kBaseFigureSize.height * 3 / 2)
        figureIBase.addChild(figure)
        
        return figureIBase
    }
    
    class func figureOFill() -> FigureNode {
        let figureOFill = FigureNode.init(color: NSColor.blue, size: CGSize.init(width: kBaseFigureSize.width * 2, height: kBaseFigureSize.height * 2))
        return figureOFill
    }
    
    class func figureOBase() -> FigureNode {
        let figureOBase = FigureNode.init(color: NSColor.clear, size: CGSize.init(width: kBaseFigureSize.width * 2, height: kBaseFigureSize.height * 2))
        
        var figure = SKSpriteNode.init(color: NSColor.blue, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureOBase.position.x - kBaseFigureSize.width / 2, y: figureOBase.position.y - kBaseFigureSize.height / 2)
        figureOBase.addChild(figure)
    
        figure = SKSpriteNode.init(color: NSColor.blue, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureOBase.position.x - kBaseFigureSize.width / 2, y: figureOBase.position.y + kBaseFigureSize.height / 2)
        figureOBase.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.blue, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureOBase.position.x + kBaseFigureSize.width / 2, y: figureOBase.position.y + kBaseFigureSize.height / 2)
        figureOBase.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.blue, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureOBase.position.x + kBaseFigureSize.width / 2, y: figureOBase.position.y - kBaseFigureSize.height / 2)
        figureOBase.addChild(figure)
        
        return figureOBase
    }
    
    class func figureT() -> FigureNode {
        let figureT = FigureNode.init(color: NSColor.clear, size: CGSize.init(width: kBaseFigureSize.width * 3, height: kBaseFigureSize.height * 2))
        
        var figure = SKSpriteNode.init(color: NSColor.purple, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureT.position.x - kBaseFigureSize.width, y: figureT.position.y + kBaseFigureSize.height / 2)
        figureT.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.purple, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureT.position.x, y: figureT.position.y + kBaseFigureSize.height / 2)
        figureT.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.purple, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureT.position.x + kBaseFigureSize.width, y: figureT.position.y + kBaseFigureSize.height / 2)
        figureT.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.purple, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureT.position.x, y: figureT.position.y - kBaseFigureSize.height / 2)
        figureT.addChild(figure)
        
        return figureT
    }
    
    class func figureL() -> FigureNode {
        let figureL = FigureNode.init(color: NSColor.clear, size: CGSize.init(width: kBaseFigureSize.width * 2, height: kBaseFigureSize.height * 3))
        
        var figure = SKSpriteNode.init(color: NSColor.brown, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureL.position.x + kBaseFigureSize.width / 2, y: figureL.position.y - kBaseFigureSize.height)
        figureL.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.brown, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureL.position.x - kBaseFigureSize.width / 2, y: figureL.position.y - kBaseFigureSize.height)
        figureL.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.brown, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureL.position.x - kBaseFigureSize.width / 2, y: figureL.position.y)
        figureL.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.brown, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureL.position.x - kBaseFigureSize.width / 2, y: figureL.position.y + kBaseFigureSize.height)
        figureL.addChild(figure)
        
        return figureL
    }
    
    class func figureJ() -> FigureNode {
        let figureJ = FigureNode.init(color: NSColor.clear, size: CGSize.init(width: kBaseFigureSize.width * 2, height: kBaseFigureSize.height * 3))
        
        var figure = SKSpriteNode.init(color: NSColor.red, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureJ.position.x + kBaseFigureSize.width / 2, y: figureJ.position.y + kBaseFigureSize.height)
        figureJ.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.red, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureJ.position.x + kBaseFigureSize.width / 2, y: figureJ.position.y)
        figureJ.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.red, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureJ.position.x - kBaseFigureSize.width / 2, y: figureJ.position.y - kBaseFigureSize.height)
        figureJ.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.red, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureJ.position.x + kBaseFigureSize.width / 2, y: figureJ.position.y - kBaseFigureSize.height)
        figureJ.addChild(figure)
        
        return figureJ
    }
    
    class func figureZ() -> FigureNode {
        let figureZ = FigureNode.init(color: NSColor.clear, size: CGSize.init(width: kBaseFigureSize.width * 3, height: kBaseFigureSize.height * 2))
        
        var figure = SKSpriteNode.init(color: NSColor.green, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureZ.position.x - kBaseFigureSize.width, y: figureZ.position.y + kBaseFigureSize.height / 2)
        figureZ.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.green, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureZ.position.x, y: figureZ.position.y + kBaseFigureSize.height / 2)
        figureZ.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.green, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureZ.position.x, y: figureZ.position.y - kBaseFigureSize.height / 2)
        figureZ.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.green, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureZ.position.x + kBaseFigureSize.width, y: figureZ.position.y - kBaseFigureSize.height / 2)
        figureZ.addChild(figure)
        
        return figureZ
    }
    
    class func figureS() -> FigureNode {
        let figureS = FigureNode.init(color: NSColor.clear, size: CGSize.init(width: kBaseFigureSize.width * 3, height: kBaseFigureSize.height * 2))
        
        var figure = SKSpriteNode.init(color: NSColor.yellow, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureS.position.x, y: figureS.position.y + kBaseFigureSize.height / 2)
        figureS.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.yellow, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureS.position.x + kBaseFigureSize.width, y: figureS.position.y + kBaseFigureSize.height / 2)
        figureS.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.yellow, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureS.position.x - kBaseFigureSize.width, y: figureS.position.y - kBaseFigureSize.height / 2)
        figureS.addChild(figure)
        
        figure = SKSpriteNode.init(color: NSColor.yellow, size: kBaseFigureSize)
        figure.position = CGPoint(x: figureS.position.x, y: figureS.position.y - kBaseFigureSize.height / 2)
        figureS.addChild(figure)
        
        return figureS
    }
}

