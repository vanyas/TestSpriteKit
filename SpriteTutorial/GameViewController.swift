//
//  GameViewController.swift
//  SpriteTutorial
//
//  Created by Vangeli Ontiveros Islas on 16/07/17.
//  Copyright (c) 2017 com.vangeli. All rights reserved.
//

import UIKit
import QuartzCore
import SpriteKit

class GameViewController: UIViewController {

  
  @IBOutlet weak var sceneView: SKView!

  override func viewDidLoad() {
    super.viewDidLoad()
    let scene = GameScene(size: sceneView.bounds.size)
    let skView = sceneView
    skView.showsFPS = false
    skView.showsNodeCount = false
    skView.ignoresSiblingOrder = true
    scene.scaleMode = .ResizeFill
    skView.presentScene(scene)
  }


  override func willMoveToParentViewController(parent: UIViewController?) {
    if parent == nil {
      sceneView.scene?.removeAllActions()
      sceneView.scene?.removeAllChildren()
    }
  }


  override func shouldAutorotate() -> Bool {
    return true
  }

  override func prefersStatusBarHidden() -> Bool {
    return false
  }

  override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
    if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
      return .AllButUpsideDown
    } else {
      return .All
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }

}
