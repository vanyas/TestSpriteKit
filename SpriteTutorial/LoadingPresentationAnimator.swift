//
//  LoadingPresentationAnimator.swift
//  SpriteTutorial
//
//  Created by Vangeli Ontiveros Islas on 16/07/17.
//  Copyright © 2017 com.vangeli. All rights reserved.
//

import UIKit

enum LoadingAnimationType {
  case presentation
  case dismissal
}

class LoadingPresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {

  var animationType: LoadingAnimationType

  init(animationType:LoadingAnimationType) {
    self.animationType = animationType
  }


  // MARK: UIViewControllerAnimatedTransitioning

  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    return 0.3
  }

  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

    let key = animationType == .presentation ?
    UITransitionContextToViewControllerKey :
    UITransitionContextFromViewControllerKey

    guard let controller = transitionContext.viewControllerForKey(key) else {
      return
    }


    var initialtransForm = CGAffineTransformIdentity
    var finalTransform = CGAffineTransformIdentity

    if animationType == .presentation {
      transitionContext.containerView()?.addSubview(controller.view)
      initialtransForm = CGAffineTransformMakeScale(0.1, 0.1)
    } else {
      finalTransform = CGAffineTransformMakeScale(0.1, 0.1)
    }


    let duration = transitionDuration(transitionContext)
    controller.view.frame = transitionContext.finalFrameForViewController(controller)
    controller.view.transform = initialtransForm
    UIView.animateWithDuration(
      duration,
      delay: 0.0,
      options: [UIViewAnimationOptions.CurveEaseInOut],
      animations: { 
        controller.view.transform = finalTransform
      }
    ) { (finished) in
        transitionContext.completeTransition(finished)
    }

  }

}
