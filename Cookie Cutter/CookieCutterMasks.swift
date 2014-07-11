//
//  RWTCookieCutterMasks.swift
//  Cookie Cutter
//
//  Created by Chris Lowe on 7/1/14.
//  Copyright (c) 2014 Chris Lowe. All rights reserved.
//

import Foundation
import UIKit

class CookieCutterMasks: NSObject {
    
    class func sizeToFitOriginalFrame(frame: CGRect) -> CGRect {
        
        // Determine which side is smaller so we can ensure our shapes fit in the view correctly
        let minSize = min(CGRectGetWidth(frame), CGRectGetHeight(frame))
        
        // Make a new frame out of the original frame.  Set X, Y to the center and use width, height from shortest side (caluclated above)
        let bestSize = CGRectMake(CGRectGetWidth(frame)/2.0 - minSize/2.0, CGRectGetHeight(frame)/2.0 - minSize/2.0, minSize, minSize)
        
        return bestSize
    }
    
    class func bezierPathForHeartShapeInRect(originalFrame: CGRect) -> UIBezierPath {
        let frame = sizeToFitOriginalFrame(originalFrame)
        var bezierPath = UIBezierPath()

        // Path starts at the top point of the right part of the heart
        bezierPath.moveToPoint(CGPointMake(CGRectGetMinX(frame) + (0.742 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.049 * CGRectGetHeight(frame))))
        
        // Move down to the center point of the heart shape (the bottom of the (V))
        bezierPath.addCurveToPoint(CGPointMake(CGRectGetMinX(frame) + (0.500 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.241 * CGRectGetHeight(frame))),
            controlPoint1: CGPointMake(CGRectGetMinX(frame) + (0.647 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.050 * CGRectGetHeight(frame))),
            controlPoint2: CGPointMake(CGRectGetMinX(frame) + (0.550 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.112 * CGRectGetHeight(frame))))
        
        // Move up to the top of the left part of the heart (effectively outlineing in the 'gap' at the top of the (V))
        bezierPath.addCurveToPoint(CGPointMake(CGRectGetMinX(frame) + (0.330 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.064 * CGRectGetHeight(frame))),
            controlPoint1: CGPointMake(CGRectGetMinX(frame) + (0.460 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.147 * CGRectGetHeight(frame))),
            controlPoint2: CGPointMake(CGRectGetMinX(frame) + (0.398 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.089 * CGRectGetHeight(frame))))
        
        // Move down to the outter (widest) point of the left side of the heart
        bezierPath.addCurveToPoint(CGPointMake(CGRectGetMinX(frame) + (0.253 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.050 * CGRectGetHeight(frame))),
            controlPoint1: CGPointMake(CGRectGetMinX(frame) + (0.305 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.055 * CGRectGetHeight(frame))),
            controlPoint2: CGPointMake(CGRectGetMinX(frame) + (0.279 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.050 * CGRectGetHeight(frame))))
        
        // Move down to the mid point of the left sweeping curve of the heart
        bezierPath.addCurveToPoint(CGPointMake(CGRectGetMinX(frame) + (0.008 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.361 * CGRectGetHeight(frame))),
            controlPoint1: CGPointMake(CGRectGetMinX(frame) + (0.128 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.051 * CGRectGetHeight(frame))),
            controlPoint2: CGPointMake(CGRectGetMinX(frame) + (0.010 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.160 * CGRectGetHeight(frame))))
        
        // Move down to the bottom point of the left sweeping curve of the heart
        bezierPath.addCurveToPoint(CGPointMake(CGRectGetMinX(frame) + (0.296 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.704 * CGRectGetHeight(frame))),
            controlPoint1: CGPointMake(CGRectGetMinX(frame) + (0.007 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.554 * CGRectGetHeight(frame))),
            controlPoint2: CGPointMake(CGRectGetMinX(frame) + (0.180 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.627 * CGRectGetHeight(frame))))
        
        // Move down to the tip of the bottom of the heart
        bezierPath.addCurveToPoint(CGPointMake(CGRectGetMinX(frame) + (0.501 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.925 * CGRectGetHeight(frame))),
            controlPoint1: CGPointMake(CGRectGetMinX(frame) + (0.408 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.779 * CGRectGetHeight(frame))),
            controlPoint2: CGPointMake(CGRectGetMinX(frame) + (0.488 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.881 * CGRectGetHeight(frame))))
        
        // Move up to the bottom point of the right sweeping curve of the heart
        bezierPath.addCurveToPoint(CGPointMake(CGRectGetMinX(frame) + (0.702 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.704 * CGRectGetHeight(frame))),
            controlPoint1: CGPointMake(CGRectGetMinX(frame) + (0.510 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.882 * CGRectGetHeight(frame))),
            controlPoint2: CGPointMake(CGRectGetMinX(frame) + (0.600 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.779 * CGRectGetHeight(frame))))
        
        // Move up to the mid point of the right sweeping curve of the heart
        bezierPath.addCurveToPoint(CGPointMake(CGRectGetMinX(frame) + (0.992 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.359 * CGRectGetHeight(frame))),
            controlPoint1: CGPointMake(CGRectGetMinX(frame) + (0.815 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.622 * CGRectGetHeight(frame))),
            controlPoint2: CGPointMake(CGRectGetMinX(frame) + (0.993 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.552 * CGRectGetHeight(frame))))
        
        // Move up to the outter (widest) point on the right side of the heart
        bezierPath.addCurveToPoint(CGPointMake(CGRectGetMinX(frame) + (0.742 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.050 * CGRectGetHeight(frame))),
            controlPoint1: CGPointMake(CGRectGetMinX(frame) + (0.990 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.157 * CGRectGetHeight(frame))),
            controlPoint2: CGPointMake(CGRectGetMinX(frame) + (0.868 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.048 * CGRectGetHeight(frame))))
        
        // Move up to connect the outter point to the top right part of the heart
        bezierPath.closePath()
        
        bezierPath.miterLimit = 4;
        
        return bezierPath;
    }
    
    class func bezierPathForStarShapeInRect(originalFrame: CGRect) -> UIBezierPath {
        let frame = sizeToFitOriginalFrame(originalFrame)
        var bezierPath = UIBezierPath()
        
            // Path starts at the tip of the top point
        bezierPath.moveToPoint(CGPointMake(CGRectGetMinX(frame) + (0.500 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.050 * CGRectGetHeight(frame))))
        // Move down the right side of the top point
        bezierPath.addLineToPoint(CGPointMake(CGRectGetMinX(frame) + (0.676 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.307 * CGRectGetHeight(frame))))
        // Move down and over to the top half of the right top point
        bezierPath.addLineToPoint(CGPointMake(CGRectGetMinX(frame) + (0.976 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.396 * CGRectGetHeight(frame))))
        // Move down to the bottom half of the right top point
        bezierPath.addLineToPoint(CGPointMake(CGRectGetMinX(frame) + (0.785 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.643 * CGRectGetHeight(frame))))
        // Move down to the top half of the right bottom point
        bezierPath.addLineToPoint(CGPointMake(CGRectGetMinX(frame) + (0.794 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.955 * CGRectGetHeight(frame))))
        // Move up  to the bottom half of the right bottom point
        bezierPath.addLineToPoint(CGPointMake(CGRectGetMinX(frame) + (0.500 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.850 * CGRectGetHeight(frame))))
        // Move down to the bottom half of the left bottom point
        bezierPath.addLineToPoint(CGPointMake(CGRectGetMinX(frame) + (0.206 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.955 * CGRectGetHeight(frame))))
        // Move up to the top half of the left bottom point
        bezierPath.addLineToPoint(CGPointMake(CGRectGetMinX(frame) + (0.215 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.643 * CGRectGetHeight(frame))))
        // Move over to the bottom half of the left top point
        bezierPath.addLineToPoint(CGPointMake(CGRectGetMinX(frame) + (0.025 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.396 * CGRectGetHeight(frame))))
        // Move up to the top half of the left top point
        bezierPath.addLineToPoint(CGPointMake(CGRectGetMinX(frame) + (0.324 * CGRectGetWidth(frame)), CGRectGetMinY(frame) + (0.307 * CGRectGetHeight(frame))))
        // Move up to connect the top half of the left top point to the bottom (in this case, left) half of the top point
        bezierPath.closePath()
        
        return bezierPath
    }
    
    class func bezierPathForCookieShapeInRect(originalFrame: CGRect) -> UIBezierPath {
        let frame = sizeToFitOriginalFrame(originalFrame)
        
        // Return the bezierPath sized to our 'best fitting' frame for maximum circle diameter.
        return UIBezierPath(ovalInRect: frame)
    }
}