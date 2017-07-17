//
//  LoadintPresentationController.swift
//  SpriteTutorial
//
//  Created by Vangeli Ontiveros Islas on 16/07/17.
//  Copyright © 2017 com.vangeli. All rights reserved.
//

import UIKit

class LoadingTransitioningManager: NSObject, UIViewControllerTransitioningDelegate {

  func presentationControllerForPresentedViewController(
    presented: UIViewController,
    presentingViewController presenting: UIViewController,
    sourceViewController source: UIViewController) -> UIPresentationController? {

    let presentationController = LoadingPresentationController(
      presentedViewController: presented,
      presentingViewController: presenting
    )

    return presentationController
  }

  func animationControllerForPresentedController(
    presented: UIViewController,
    presentingController presenting: UIViewController,
    sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {

    return LoadingPresentationAnimator(animationType: LoadingAnimationType.presentation)
  }

  func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {

    return LoadingPresentationAnimator(animationType: LoadingAnimationType.dismissal)
  }
}
