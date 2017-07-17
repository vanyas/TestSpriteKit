//
//  LoadingPresentationController.swift
//  SpriteTutorial
//
//  Created by Vangeli Ontiveros Islas on 16/07/17.
//  Copyright © 2017 com.vangeli. All rights reserved.
//

import UIKit

class LoadingPresentationController: UIPresentationController {

  private var dimmingView: UIView!

  override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
    super.init(
      presentedViewController: presentedViewController,
      presentingViewController: presentingViewController
    )

    setupDimmingView()
  }

  // MARK: Setup

  func setupDimmingView() {
    dimmingView = UIView()
    dimmingView.translatesAutoresizingMaskIntoConstraints = false
    dimmingView.backgroundColor = UIColor(white: 0, alpha: 0.7)
    dimmingView.alpha = 0

    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
    dimmingView.addGestureRecognizer(tapGesture)
  }

  dynamic func handleTap(gesture: UITapGestureRecognizer) {
    presentingViewController.dismissViewControllerAnimated(true, completion: nil)
  }

  // MARK: Override Presentation

  override func presentationTransitionWillBegin() {

    guard let containerView = containerView else {
      return
    }

    containerView.insertSubview(dimmingView, atIndex: 0)

    let size = sizeForChildContentContainer(
      presentedViewController,
      withParentContainerSize: containerView.bounds.size
    )

    presentedView()?.layer.cornerRadius = size.height / 8

    //Set Constraints
    NSLayoutConstraint.activateConstraints(
      NSLayoutConstraint.constraintsWithVisualFormat(
        "V:|[dimmingView]|",
        options: [],
        metrics: nil,
        views: ["dimmingView": dimmingView]
      )
    )
    NSLayoutConstraint.activateConstraints(
      NSLayoutConstraint.constraintsWithVisualFormat(
        "H:|[dimmingView]|",
        options: [],
        metrics: nil,
        views: ["dimmingView": dimmingView]
      )
    )

    // Add dimming to transition Animation
    guard let coordinator = presentedViewController.transitionCoordinator() else {
      dimmingView.alpha = 1.0
      return
    }

    coordinator.animateAlongsideTransition({ [unowned self] (_) in
      self.dimmingView.alpha = 1.0
      }, completion: nil
    )
  }

  override func dismissalTransitionWillBegin() {
    // Remove dimming from transition Animation
    guard let coordinator = presentedViewController.transitionCoordinator() else {
      dimmingView.alpha = 0.0
      return
    }

    coordinator.animateAlongsideTransition({ [unowned self] (_) in
      self.dimmingView.alpha = 0.0
      }, completion: nil
    )
  }

  override func containerViewWillLayoutSubviews() {
    presentedView()?.frame = frameOfPresentedViewInContainerView()
  }

  override func sizeForChildContentContainer(container: UIContentContainer,
                                             withParentContainerSize parentSize: CGSize) -> CGSize {

    return CGSize(width: 200, height: 148)
  }

  override func frameOfPresentedViewInContainerView() -> CGRect {

    let contanierBounds = containerView!.bounds
    var frame = CGRect.zero

    frame.size = sizeForChildContentContainer(
      presentedViewController,
      withParentContainerSize: contanierBounds.size
    )

    frame.origin = CGPoint(
      x: CGRectGetMidX(contanierBounds) - frame.size.width/2,
      y: CGRectGetMidY(contanierBounds) - frame.size.height/2
    )

    return frame
  }
}
