//
//  FigureNode.swift
//  SpriteKitGame
//
//  Created by Kuzmin Pavel on 9/12/18.
//  Copyright © 2018 Kuzmin. All rights reserved.
//

import SpriteKit

class FigureNode: SKSpriteNode {
    override func contains(_ p: CGPoint) -> Bool {
        if self.children.count > 0 {
            let point = self.convert(p, from: self.parent!)
            
            for figure in self.children {
                if figure.contains(point) {
                    return true
                }
            }
            
            return  false
        }
        
        return super.contains(p)
    }
}
