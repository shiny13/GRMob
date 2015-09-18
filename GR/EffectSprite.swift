//
//  EffectSprite.swift
//  GR
//
//  Created by Shahnawaz Alam on 19/09/2015.
//  Copyright © 2015 Shahnawaz Alam. All rights reserved.
//

import SpriteKit

protocol EffectSprite {
    func spawn(parentNode: SKNode, canvasSize: CGSize)
    func playCreateAnimation(canvasSize: CGSize)
    func removeAnimation(canvasSize: CGSize)
}
