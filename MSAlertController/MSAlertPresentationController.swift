//
//  MSAlertPresentationController.swift
//  MSAlertController
//
//  Created by manish kumar on 28/02/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import Foundation
/**
 * Presents a view controller modally by superposing it's view on top of the
 * presenting's view, but retaining it's context.
 *
 * Useful for creating a modal presentation with a dimmed background.
 */

enum MSAlertCustomPresentationAnimation {
    case MSAlertCustomPresentationAnimationBottomToTop
    case MSAlertCustomPresentationAnimationFadeIn
}

let MSCustomPresentationAnimationDuration = 0.25

class MSAlertPresentationController: UIPresentationController {

  fileprivate var dimmingView: UIView!
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        setupDimmingView()
    }
}

// MARK: - Add Dimming View
private extension MSAlertPresentationController {
    func setupDimmingView() {
        dimmingView = UIView()
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        dimmingView.alpha = 0.0
    }
}

// MARK: - MSAlertPresentationAnimator Object
class MSAlertPresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private var isPresenting: Bool
    private var animation: MSAlertCustomPresentationAnimation
    
    init(animation presentationAnimation: MSAlertCustomPresentationAnimation, presenting isPresenting: Bool) {
        self.isPresenting = isPresenting
        self.animation = presentationAnimation
        super.init()
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning Protocol
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return MSCustomPresentationAnimationDuration
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let containerView = transitionContext.containerView
        let toView = toViewController.view
        if isPresenting {
            containerView.addSubview(toView!)
            toView?.frame = CGRect(x: containerView.frame.origin.x, y: containerView.frame.origin.y + containerView.frame.size.height, width: containerView.frame.size.width, height: containerView.frame.size.height)

            toView?.alpha = 1.0            
            UIView.animate(withDuration: MSCustomPresentationAnimationDuration, animations: {
                toView?.frame = containerView.frame
                transitionContext.completeTransition(true)
            })
        }
    }
}
