//
//  CrossFadeAnimationController.swift
//  CBALoop
//
//  Created by Jarret Hardie on 22/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

class CrossFadeAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var duration: TimeInterval = 0.5
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to) else {
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            return
        }
        
        toViewController.view.frame = transitionContext.finalFrame(for: toViewController)
        toViewController.view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        transitionContext.containerView.insertSubview(toViewController.view, at: 0)
        
        guard let fromViewController = transitionContext.viewController(forKey: .from) else {
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            return
        }
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            fromViewController.view.alpha = 0
            toViewController.view.transform = CGAffineTransform.identity
        }, completion: { (finished) in
            fromViewController.view.transform = CGAffineTransform.identity
            fromViewController.view.alpha = 1.0
            
            if !transitionContext.transitionWasCancelled {
                fromViewController.view.removeFromSuperview()
            }
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
        
    }
    
}
