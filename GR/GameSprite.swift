//
//  GameSprite.swift
//  GR
//
//  Created by Shahnawaz Alam on 3/09/2015.
//  Copyright (c) 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

protocol GameSprite {
    var textureAtlas: SKTextureAtlas { get set }
    func spawn(parentNode: SKNode, position: CGPoint, size:
    CGSize)
    func onTap()
}

