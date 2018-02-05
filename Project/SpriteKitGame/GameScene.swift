//
//  GameScene.swift
//  SpriteKitGame
//
//  Created by Kuzmin on 09.06.17.
//  Copyright © 2017 Kuzmin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var personTexture: SKTexture = SKTexture(image: #imageLiteral(resourceName: "idle_1"))
    private var personNode: SKSpriteNode!
    
    private var spinnyNode : SKShapeNode?
    private var ground : SKSpriteNode?
        
    override func didMove(to view: SKView) {
        personNode = SKSpriteNode(texture: personTexture)
        personNode.anchorPoint = CGPoint(x: 0.5, y: 0)
        personNode.position = CGPoint(x: -size.width/2 + personTexture.size().width, y: -size.height/2)
        self.addChild(personNode)
        
        self.ground = self.childNode(withName: "//ground") as? SKSpriteNode
        
        // Get label node from scene and store it for use later
//        if let label = self.childNode(withName: "//helloLabel") as? SKLabelNode {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
        
        let turnAction = getTurnAction()
        personNode.run(turnAction)
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
        
        let idleAction = getIdleAction()
        personNode.run(idleAction)
    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
//        case 0x31:
//            if let label = self.label {
//                label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//            }
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
        
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func getIdleAction() -> SKAction {
        let textures: [SKTexture] = [SKTexture(image: #imageLiteral(resourceName: "idle_1")), SKTexture(image: #imageLiteral(resourceName: "idle_2")), SKTexture(image: #imageLiteral(resourceName: "idle_3")), SKTexture(image: #imageLiteral(resourceName: "idle_2")), SKTexture(image: #imageLiteral(resourceName: "idle_1"))]
        
        let idleAction = SKAction.animate(with: textures, timePerFrame: 0.05)
        return idleAction
    }
    
    func getTurnAction() -> SKAction {
        let textures: [SKTexture] = [SKTexture(image: #imageLiteral(resourceName: "turn_1")), SKTexture(image: #imageLiteral(resourceName: "turn_2")), SKTexture(image: #imageLiteral(resourceName: "turn_3"))]
        
        let turnAction = SKAction.animate(with: textures, timePerFrame: 0.05)
        return turnAction
    }
}
