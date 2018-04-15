//
//  MSAnimator.swift
//  MSAlertController
//
//  Created by manish kumar on 30/03/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import Foundation

// Alertview state
enum State {
    case closed
    case open
}

extension State {
    var opposite: State {
        switch self {
        case .open: return .closed
        case .closed: return .open
        }
    }
}

// Actionsheet state
enum ActionSheetState {
    case closed
    case open
}

extension ActionSheetState {
    var opposite: ActionSheetState {
        switch self {
        case .open: return .closed
        case .closed: return .open
        }
    }
}

class MSAlertAnimator {
    
    //MARK:- Variables
    private let initialState: AnimationBlock
    private let finalState: AnimationBlock
    private(set) var currentState: State = .closed
    var animationProgress = [CGFloat]()
    var animators = [UIViewPropertyAnimator]()
    
    init(state initial: @escaping AnimationBlock, final: @escaping AnimationBlock) {
        self.initialState = initial
        self.finalState = final
    }
    
    //MARK:- Animation Intelligence
    func setAnimation(to state: State) {
        guard self.animators.isEmpty else {
            return
        }
        
        var transitionAnimator: UIViewPropertyAnimator
        switch self.currentState {
            case .open:
                transitionAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
                [unowned self] in
                self.initialState()
            })
            break
        case .closed:
                transitionAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
                    self.finalState()
                })
                break
        }
        
        transitionAnimator.addCompletion { [unowned self] (position )  in
            print("Animation Ended")
            switch position {
                case .start:
                    self.currentState = state.opposite
                case .end:
                    self.currentState = state
                case .current:
                    ()
            }
            
            // change state
            switch self.currentState {
                case .open:
                    self.finalState()
                    break
                case .closed:
                    self.initialState()
            }
            self.animators.removeAll()
            self.animationProgress.removeAll()
        }
        
        animators.append(transitionAnimator)
        animators.forEach({$0.startAnimation()})
        animators.forEach({$0.pauseAnimation()})
    }
    
    func trackProgress() {
        animationProgress = animators.map { $0.fractionComplete }
    }
    
    func completeAnimation() {
        animators.forEach { $0.continueAnimation(withTimingParameters: nil, durationFactor: 0) }
        animators.removeAll()
    }
    
    func stopAnimation() {
        animators.forEach { $0.stopAnimation(true)}
    }
    
    func startAnimation() {
        animators.forEach { $0.startAnimation()}
    }
    
    func reverseAnimation(sidegap: CGFloat) {
        animators.forEach {
            
            switch self.currentState {
            case .open:
                if sidegap > 75 {
                    $0.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                }
                else {
                    $0.isReversed = true
                    $0.startAnimation()
                }
                break
            case .closed:
                if sidegap < 100 {
                    switch $0.state {
                    case .active:
                        $0.isReversed = true
                        $0.startAnimation()
                    default:
                        break
                    }
                }
                break
            }
        }
    }
    
    func setFractionComplete(fraction: CGFloat) {
        for (index, animator) in animators.enumerated() {
            animator.fractionComplete = log(fraction * 6)  + animationProgress[index]
        }
    }
}
