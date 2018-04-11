//
//  UIPanGestureRecognizer+Extension.swift
//  MSAlertController
//
//  Created by manish kumar on 11/04/18.
//  Copyright © 2018 Manish Kumar. All rights reserved.
//

import Foundation


public enum PanDirection: Int {
    case up, down, left, right
    public var isVertical: Bool { return [.up, .down].contains(self) }
    public var isHorizontal: Bool { return !isVertical }
}

public extension UIPanGestureRecognizer {
    
    public var direction: PanDirection? {
        let velocity = self.velocity(in: view)
        let isVertical = fabs(velocity.y) > fabs(velocity.x)
        switch (isVertical, velocity.x, velocity.y) {
        case (true, _, let y) where y < 0: return .up
        case (true, _, let y) where y > 0: return .down
        case (false, let x, _) where x > 0: return .right
        case (false, let x, _) where x < 0: return .left
        default: return nil
        }
    }
}
