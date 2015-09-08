//
//  Ground.swift
//  GR
//
//  Created by Shahnawaz Alam on 3/09/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

class Ground: SKSpriteNode, GameSprite {

    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "ground.atlas")
    //Optional variable to store current texture
    var groundTexture: SKTexture?
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize) {
        parentNode.addChild(self)
        self.size = size
        self.position = position
        //Setting a custom anchor point since its a background
        self.anchorPoint = CGPointMake(0, 1)
        
        //Default to the ice texture
        if groundTexture == nil {
            groundTexture = textureAtlas.textureNamed("ice-tile.png")
        }
        
        //Creating child nodes to repeat texture
        createChildren()
    }
    
    //Create child nodes to repeat texture
    func createChildren() {
        //Firstly, setting a ground texture value
        if let texture = groundTexture {
            var tileCount:CGFloat = 0
            let textureSize = texture.size()
            
            //Setting the size to half for retina sharpness
            let tileSize = CGSize(width: textureSize.width/2, height: textureSize.height/2)
            
            //Building nodes for the entire scene
            while tileCount * tileSize.width < self.size.width {
                let tileNode = SKSpriteNode(texture: texture)
                tileNode.size = tileSize
                tileNode.position.x = tileCount * tileSize.width
                
                //Setting new anchor points again!
                tileNode.anchorPoint = CGPoint(x: 0, y:1)
                
                //Add the child texture to the ground Node
                self.addChild(tileNode)
                
                tileCount++
            }
        }
        
    }
    
    func onTap() {
        
    }
}
