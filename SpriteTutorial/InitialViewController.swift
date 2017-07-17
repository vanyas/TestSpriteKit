//
//  InitialViewController.swift
//  SpriteTutorial
//
//  Created by Vangeli Ontiveros Islas on 16/07/17.
//  Copyright © 2017 com.vangeli. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

  lazy var customPresentationDelegate = LoadingTransitioningManager()

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


   // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
    guard let loadingController = segue.destinationViewController as? GameViewController else {
      super.prepareForSegue(segue, sender: sender)
      return
    }

    loadingController.transitioningDelegate = customPresentationDelegate
    loadingController.modalPresentationStyle = .Custom


   }

}
