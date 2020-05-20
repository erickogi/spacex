//
//  NavigationController.swift
//  CBALoop
//
//  Created by Jarret Hardie on 22/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    
    // MARK: - Setup & Appearance
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        delegate = self
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        var topVC = ""
        if let topViewController = topViewController  {
            topVC = String(describing: type(of: topViewController))
        }

        guard String(describing: type(of: viewController)) != topVC else {
            return
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
    }
    
    
    // MARK: - Appearance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = UIColor.black
        navigationBar.tintColor = .white
        let font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
        navigationBar.titleTextAttributes = [
            .font: font,
            .foregroundColor: UIColor.white
        ]
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        
        let backTitleOffset = UIOffset(horizontal: -500, vertical: 0)
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(backTitleOffset, for: .default)
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(backTitleOffset, for: .compact)
        
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    // MARK: - Navigation behaviour
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if toVC as? NavigationControllerRoot != nil && operation == .push {
            return CrossFadeAnimationController()
        }
        
        return nil
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
    
    
    // MARK: - Progress bar
    // Adapted from: https://github.com/ykyouhei/KYNavigationProgress
    
    var progress: Float {
        get { return progressView.progress }
        set { progressView.progress = newValue }
    }
    
    var progressView: NavigationProgressView {
        for subview in navigationBar.subviews {
            if let progressView = subview as? NavigationProgressView {
                return progressView
            }
        }
        
        let defaultHeight = CGFloat(4)
        let frame = CGRect(
            x: 0,
            y: navigationBar.frame.height - defaultHeight,
            width: navigationBar.frame.width,
            height: defaultHeight
        )
        let progressView = NavigationProgressView(frame: frame)
        progressView.alpha = 0
        
        navigationBar.addSubview(progressView)
        
        progressView.autoresizingMask = [
            .flexibleWidth, .flexibleTopMargin
        ]
        
        return progressView
    }
    
    func setProgress(_ progress: Float, animated: Bool) {
        progressView.alpha = 1
        progressView.bar.alpha = 1
        progressView.setProgress(progress, animated: animated)
    }
    
    func finishProgress() {
        progressView.alpha = 1
        progressView.bar.alpha = 1
        progressView.setProgress(1, animated: true)
        
        UIView.animate(withDuration: 0.25,
                       animations: {
                        self.progressView.bar.alpha = 0
        }, completion: { finished in
            self.progressView.progress = 0
        }
        )
    }
    
    func cancelProgress() {
        if progressView.alpha < 1 {
            return
        }
        progressView.setProgress(0, animated: true)
        
        UIView.animate(withDuration: 0.25, animations: {
            self.progressView.alpha = 0
        })
    }
    
}
