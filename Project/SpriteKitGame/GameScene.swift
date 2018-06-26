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
        print("Down")
        print("new target position X: \(targetXPostion)")
    }

    private func touchMoved(toPoint pos : CGPoint) {
        targetXPostion = pos.x
        print("Moved")
        print("new target position X: \(targetXPostion)")
    }

    private func touchUp(atPoint pos : CGPoint) {
        targetXPostion = pos.x
        print("Up")
        print("new target position X: \(targetXPostion)")

        let turnInAction = SKAction.getTurnInAction()

        personNode.run(SKAction.sequence([turnInAction])) {
            self.walkAction(to: self.targetXPostion)
        }
    }

    private func walkAction(to x: CGFloat) {
        let walkAction = SKAction.repeat(SKAction.getWalkLeftAction(), count: 7)
        let movedAction = self.movedAction(to: self.targetXPostion)

        personNode.run(SKAction.group([walkAction, movedAction])) {
            let turnOutAction = SKAction.getTurnOutAction()
            let idleAction = SKAction.getIdleAction()
            self.personNode.run(SKAction.sequence([turnOutAction, idleAction]))
        }
    }

    private func movedAction(to x: CGFloat) -> SKAction {
        return SKAction.moveTo(x: x, duration: 2.1)
    }
}
