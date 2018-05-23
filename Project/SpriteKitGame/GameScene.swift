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
    
    private let personTexture: SKTexture = SKTexture(image: #imageLiteral(resourceName: "idle_1"))
    private var personNode: SKSpriteNode!
    
    private var targetXPostion: CGFloat!
    
    private var spinnyNode : SKShapeNode?
    private var ground : SKSpriteNode?
        
    override func didMove(to view: SKView) {
        self.ground = self.childNode(withName: "//ground") as? SKSpriteNode

        personNode = SKSpriteNode(texture: personTexture)
        personNode.anchorPoint = CGPoint(x: 0.5, y: 0)
        personNode.position = CGPoint(x: -size.width/2 + personTexture.size().width, y: -size.height/2)
        self.addChild(personNode)

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

    // MARK: - private functions

    private func touchDown(atPoint pos : CGPoint) {

        targetXPostion = pos.x
        print("new target position X: \(targetXPostion)")

        let turnInAction = getTurnInAction()
        let walkAction = getWalkAction()
        personNode.run(SKAction.sequence([turnInAction, walkAction]))
    }

    private func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)

        targetXPostion = pos.x
        print("new target position X: \(targetXPostion)")
//        }

//        let walkAction = getWalkAction()
//        personNode.run(walkAction)
    }

    private func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)

        targetXPostion = pos.x
        print("new target position X: \(targetXPostion)")
//        }

        let turnOutAction = getTurnOutAction()
        let idleAction = getIdleAction()
        personNode.run(SKAction.sequence([turnOutAction, idleAction]))
    }

    private func getIdleAction() -> SKAction {
        let textures: [SKTexture] = SKTexture.idleActionTextures()
        
        let idleAction = SKAction.animate(with: textures, timePerFrame: 0.05)
        return idleAction
    }

    private func getTurnInAction() -> SKAction {
        let textures: [SKTexture] = SKTexture.turnInActionTextures()
        
        let turnAction = SKAction.animate(with: textures, timePerFrame: 0.05)
        return turnAction
    }

    private func getTurnOutAction() -> SKAction {
        let textures: [SKTexture] = SKTexture.turnOutActionTextures()
        
        let turnAction = SKAction.animate(with: textures, timePerFrame: 0.05)
        return turnAction
    }

    private func getWalkAction() -> SKAction {
        let textures: [SKTexture] = SKTexture.walkActionTextures()
        
        let walkAction = SKAction.animate(with: textures, timePerFrame: 0.05)
        return walkAction
    }
}
