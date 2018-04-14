//
//  MSAlertViewController.swift
//  MSAlert
//
//  Created by manish kumar on 26/02/18.
//  Copyright © 2018 manish kumar. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

enum MSAlertControllerStyle {
    case Default
    case SideImage
}
public class MSAlertController: UIViewController {

    var appearance: Appearance?
    private var preferredStyle: MSAlertControllerStyle = .Default
    var actionSheet: ActionSheetState = .closed
    var dynAnimator: UIDynamicAnimator!

    var gesture: UISwipeGestureRecognizer!
    var message: String
    private var alertView: MSAlertView!
    private var sideView: MSAlertSideview!

    private lazy var blurEffectView: UIVisualEffectView = {
        self.view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    
    private lazy var cancelBttn: UIButton = {
        let cancelButton = UIButton(frame: CGRect.zero)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        let bundle = Bundle(for: type(of: self))
        let cancelImage = UIImage(named: "Cancel", in: bundle, compatibleWith: nil)
        let tintedCancelImage = cancelImage?.withRenderingMode(.alwaysTemplate)
        cancelButton.setImage(tintedCancelImage, for: .normal)
        cancelButton.tintColor = .white
        cancelButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        cancelButton.adjustsImageWhenDisabled = false
        return cancelButton
    }()
    private var actions = [MSAlertAction]()
    private var animatorObj: MSAlertAnimator?
    
    private var style: MSAlertControllerStyle = .Default
    private let screen = UIScreen.main.bounds
    private var maxdx: CGFloat = Constants.Device.DeviceWidth
    // Constraints
    private var widthConstraint: NSLayoutConstraint!
    private var left: NSLayoutConstraint!
    private var right: NSLayoutConstraint!
    private var top: NSLayoutConstraint!
    private var height: NSLayoutConstraint!
    private var startLocation: CGPoint = CGPoint.zero
    private var currentLocation: CGPoint = CGPoint.zero
    private var sideGap: CGFloat {
        let dx = currentLocation.x - startLocation.x
        let dy = currentLocation.y - startLocation.y
        let distance = sqrt(dx*dx + dy*dy)
        return distance
    }
    public init(title: String, message: String, appearance: Appearance = Appearance(), sideView: UIView = {let label = UILabel(frame: CGRect.zero)
        label.text = "View"
        label.font = UIFont(name: "SanFranciscoText-Medium", size: 20)
        return label}()) {
        self.message = message
        self.appearance = appearance
        super.init(nibName: nil, bundle: nil)
        animatorObj = MSAlertAnimator(state: closeAlertView(), final: openAlertView())
        addPresentationDelegate()
        alertView = MSAlertView(frame: CGRect.zero, title: title, appearance: appearance, preferredStyle: self.style)
        alertView.textBody.text = message
        if sideView is UIImageView {
            preferredStyle = .SideImage
        }
        self.sideView = MSAlertSideview(frame: CGRect.zero, theme: appearance, view: sideView)
    }

    public override var shouldAutorotate: Bool {
        return false
    }
    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(coder:) has not been implemented")
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
        layout()
        addGesture()
        dynAnimator = UIDynamicAnimator(referenceView: view)
    }
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func addPresentationDelegate() {
        modalPresentationStyle = .overFullScreen
        self.transitioningDelegate = self
    }
    func addGesture() {
        let pan = InstantPanGestureRecognizer(target: self, action: #selector(handlePan))
        pan.delegate = self
        alertView.addGestureRecognizer(pan)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSideTap))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        if preferredStyle == .Default {
            sideView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSideTap)))
        }
    }
    func layout() {
        let margins = view.layoutMarginsGuide
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            view.addSubview(blurEffectView)
        } else {
            view.backgroundColor = .black
        }
        alertView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alertView)
        left = alertView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: Constants.Layout.Zero)
        left.isActive = true
        right = alertView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: Constants.Layout.Zero)
        right.isActive = true
        top = alertView.topAnchor.constraint(equalTo: margins.topAnchor, constant: Constants.Layout.AlertViewTop)
        top.isActive = true
        let textHeight = self.message.height(withConstrainedWidth: 100, font: (appearance?.bodyFont)!) + alertView.lblBottomHeight + 10

        if Int(textHeight) > 200 {
            height = alertView.heightAnchor.constraint(equalToConstant: 200)
        } else if Int(textHeight) < 100 {
            height = alertView.heightAnchor.constraint(equalToConstant: 100)
        } else {
            height = alertView.heightAnchor.constraint(equalToConstant: textHeight)
        }
        height.isActive = true
        sideView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sideView)
        widthConstraint = sideView.widthAnchor.constraint(equalToConstant: Constants.Layout.SideViewInitialWidth)
        widthConstraint?.isActive = true
        sideView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        sideView.topAnchor.constraint(equalTo: alertView.topAnchor).isActive = true
        sideView.heightAnchor.constraint(equalTo: alertView.heightAnchor).isActive = true
        view.addSubview(cancelBttn)
        cancelBttn.bottomAnchor.constraint(equalTo: margins.topAnchor, constant: Constants.Layout.CancelButtonBottom).isActive = true
        cancelBttn.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: Constants.Layout.Zero).isActive = true
        cancelBttn.heightAnchor.constraint(equalToConstant: Constants.Layout.CancelButtonHeight).isActive = true
        cancelBttn.widthAnchor.constraint(equalToConstant: Constants.Layout.CancelButtonWidth).isActive = true
    }
    func openAlertView() -> (() -> Void) {
        return { [weak self] in
            if let weakSelf = self {
                weakSelf.left.constant = Constants.Layout.AlertViewMaxLeft
                weakSelf.right.constant = Constants.Layout.AlertViewRight
                weakSelf.widthConstraint.constant = Constants.Layout.SideViewMaxWidth
                weakSelf.alertView.textIndicator.alpha = 0.0
                weakSelf.sideView.alpha = 1.0
                weakSelf.alertView.headerTitle.alpha = 0
                weakSelf.cancelBttn.alpha = 0
                weakSelf.view.layoutIfNeeded()
            }
        }
    }
    func closeAlertView() -> (() -> Void) {
        return { [weak self] in
            if let weakSelf = self {
                weakSelf.left.constant = Constants.Layout.Zero
                weakSelf.right.constant = Constants.Layout.Zero
                weakSelf.widthConstraint.constant = Constants.Layout.Zero
                weakSelf.sideView.alpha = 0
                weakSelf.alertView.textIndicator.alpha = 1
                weakSelf.alertView.headerTitle.alpha = 1
                weakSelf.cancelBttn.alpha = 1
                weakSelf.view.layoutIfNeeded()
            }
        }
    }

    @objc func dismissView(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    deinit {
        print("Alertview controller deleted")
    }
}

// MARK: - InstantPanGestureRecognizer
class InstantPanGestureRecognizer: UIPanGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if (self.state == UIGestureRecognizerState.began) { return }
        super.touchesBegan(touches, with: event)
        //self.state = UIGestureRecognizerState.began
    }
}

class InstantSwipeGestureRecognizer: UISwipeGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if (self.state == UIGestureRecognizerState.began) { return }
        super.touchesBegan(touches, with: event)
        self.state = UIGestureRecognizerState.began
    }
}

typealias HandleSwipeGesture = MSAlertController
extension HandleSwipeGesture {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                                  shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // Do not begin the pan until the swipe fails.
        if gestureRecognizer is UIPanGestureRecognizer &&
            otherGestureRecognizer is UISwipeGestureRecognizer {
            print("swipe failed")
            return true
        }
        return false
    }
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            print("left swipe")
        }
    }
}

// MARK: Tap
typealias HandleTapGesture = MSAlertController
extension HandleTapGesture {
    @objc func handleSideTap(sender: UIPanGestureRecognizer) {
        animatorObj?.setAnimation(to: .closed)
        animatorObj?.completeAnimation()
        if  self.actions.count > 0 {
            let sheet = MSAlertActionSheet(frame: CGRect.zero, actions: self.actions)
            self.view.addSubview(sheet)
            sheet.topAnchor.constraint(equalTo: alertView.bottomAnchor, constant: Constants.Layout.ActionSheetTop).isActive = true
            sheet.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 0).isActive = true
            sheet.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: 0).isActive = true
            sheet.heightAnchor.constraint(equalToConstant: CGFloat(self.actions.count * Int(Constants.Layout.ActionSheetRowHeight + Constants.Layout.ActionSheetRowPadding + Constants.Layout.ActionSheetLinedHeight))).isActive = true
            actionSheet = .open
        }
    }
}

// MARK: Pan
typealias HandlePanGesture = MSAlertController
extension HandlePanGesture: UIGestureRecognizerDelegate {
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        // skip touch handle
        if actionSheet == .open {
            return
        }
        switch sender.state {
            case .began:
                startLocation = sender.location(in: view)
                if let direction = sender.direction {
                    if animatorObj?.currentState == .closed {
                        if direction == .left {
                            animatorObj?.setAnimation(to: .open)
                        }
                    } else {
                        if direction == .right {
                            animatorObj?.setAnimation(to: .closed)
                        }
                    }
                }
                animatorObj?.trackProgress()
            case .changed:
                currentLocation = sender.location(in: view)
                animatorObj?.setFractionComplete(fraction: sideGap/self.maxdx)
            case .ended:
                animatorObj?.reverseAnimation(sidegap: sideGap)
                animatorObj?.completeAnimation()
                break
            default:
                break
        }
        sender.setTranslation(CGPoint.zero, in: view)
    }
}

// MARK: - Transition Delegate
typealias CustomPresentationControllerDelegate = MSAlertController
extension CustomPresentationControllerDelegate: UIViewControllerTransitioningDelegate {

    public func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        let presentationController = MSAlertPresentationController(presentedViewController: presented,
                                                                   presenting: presenting)
        return presentationController
    }

    public func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MSAlertPresentationAnimator(animation: .MSAlertCustomPresentationAnimationBottomToTop, presenting: true)
    }

    /*
    public func animationController(forDismissed dismissed: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            return MSAlertPresentationAnimator(animation: .MSAlertCustomPresentationAnimationBottomToTop, presenting: false)
    }
    */
}

// MARK: - API
public extension MSAlertController {
    public func addAction(action: MSAlertAction) {
        if actions.count < 3 &&  preferredStyle == .Default {
            action.vc = self
            actions.append(action)
        }
    }
}
