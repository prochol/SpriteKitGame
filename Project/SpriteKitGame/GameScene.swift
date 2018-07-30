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
    
    private var target: CGFloat! //X target position
    
    private var ground: SKSpriteNode?

    private var oneStepLength: CGFloat = 0
        
    override func didMove(to view: SKView) {
        self.ground = self.childNode(withName: "//ground") as? SKSpriteNode

        personNode = SKSpriteNode(texture: personTexture)
        personNode.anchorPoint = CGPoint(x: 0.5, y: 0)
        personNode.position = CGPoint(x: -size.width/2 + personTexture.size().width, y: -size.height/2)
        self.addChild(personNode)

        oneStepLength = personTexture.size().width/2
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
        target = pos.x
        print("Down")
        print("new target position X: \(target)")
    }

    private func touchMoved(toPoint pos : CGPoint) {
        target = pos.x
        print("Moved")
        print("new target position X: \(target)")
    }

    private func touchUp(atPoint pos : CGPoint) {
        target = pos.x
        print("Up")
        print("new target position X: \(target)")

        if personNode.hasActions() {
            personNode.removeAllActions()
        }

        var turnInAction = SKAction.getTurnInLeftAction()
        if personNode.position.x < target {
            turnInAction = SKAction.getTurnInRightAction()
        }
        
        personNode.run(turnInAction) {
            self.walkAction(to: self.target)
        }
    }

    private func walkAction(to x: CGFloat) {
        let pathLength = personNode.position.x < x ? x - personNode.position.x : personNode.position.x - x
        let countSteps: Int = Int(pathLength / oneStepLength)
        let countStep = CGFloat(countSteps) * oneStepLength < pathLength ? countSteps + 1 : countSteps

        var walkAction = SKAction.repeat(SKAction.getWalkLeftAction(), count: countStep)
        var turnOutAction = SKAction.getTurnOutLeftAction()
        if personNode.position.x < x {
            walkAction = SKAction.repeat(SKAction.getWalkRightAction(), count: countStep)
            turnOutAction = SKAction.getTurnOutRightAction()
        }

        let movedAction = SKAction.moveTo(x: x, duration: walkAction.duration)

        personNode.run(SKAction.group([walkAction, movedAction])) {
            let idleAction = SKAction.getIdleAction()
            self.personNode.run(SKAction.sequence([turnOutAction, idleAction]))
        }
    }
}
