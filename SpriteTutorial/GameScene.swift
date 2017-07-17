//
//  GameScene.swift
//  SpriteTutorial
//
//  Created by Vangeli Ontiveros Islas on 16/07/17.
//  Copyright © 2017 com.vangeli. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene {

  var bear : SKSpriteNode!
  var bearWalkingFrames : [SKTexture]!

  override func didMoveToView(view: SKView) {
    backgroundColor = UIColor.yellowColor()

    let bearAnimatedAtlas = SKTextureAtlas(named: "loader")
    var walkFrames = [SKTexture]()

    let numImages = bearAnimatedAtlas.textureNames.count
    print(numImages)

    walkFrames = bearAnimatedAtlas.textureNames.sort().map({ (textureName) -> SKTexture in
      return bearAnimatedAtlas.textureNamed(textureName)
    })

    bearWalkingFrames = walkFrames

    let firstFrame = bearWalkingFrames[0]
    bear = SKSpriteNode(texture: firstFrame)
    bear.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
    addChild(bear)

    let debugFrame = SKShapeNode.init(rect: bear.frame)
    debugFrame.strokeColor = SKColor.redColor()
    addChild(debugFrame)

    bear.speed = 2.0

    walkingBear()

  }

  func walkingBear() {
    //This is our general runAction method to make our bear walk.
//    let fadeIn = SKAction.fadeInWithDuration(0.025)

    let animation = SKAction.animateWithTextures(bearWalkingFrames,
      timePerFrame: 0.25,
      resize: false,
      restore: true
    )


//    let duration = 0.025 * Double(bearWalkingFrames.count) * Double(bear.speed)
//
//    let fadeOut = SKAction.fadeOutWithDuration(duration)
//
//    let group = SKAction.group([animation, fadeOut])
//
//    let wait = SKAction.waitForDuration(0.1)
//
//    let sequence = SKAction.sequence([group, wait, fadeIn])
//
    let loop = SKAction.repeatActionForever(animation)

    bear.runAction(loop, withKey:"walkingInPlaceBear")

  }

  override func update(currentTime: NSTimeInterval) {
    
  }
}
