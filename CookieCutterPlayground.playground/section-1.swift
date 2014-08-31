// Playground - noun: a place where people can play

import UIKit
import XCPlayground
import QuartzCore
import SpriteKit

let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
view.backgroundColor = UIColor.redColor()

for i in 0...30 {
  let bezier = UIBezierPath(roundedRect: view.frame, cornerRadius: CGFloat(i))
  let shapeLayer = CAShapeLayer()
  shapeLayer.path = bezier.CGPath
  view.layer.mask = shapeLayer
  XCPCaptureValue("Corner Radius \(i)", view)
  
}


UIView.animateWithDuration(10.0,
  delay: 0.0,
  options: .CurveEaseInOut | .AllowUserInteraction,
  animations: {
    view.alpha = 0.0
  },
  completion: { finished in
    })

XCPShowView("My View", view)


// Create SpriteKit View.
let view2 = SKView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))

// Add it to the Playground timeline.
XCPShowView("SpriteKit", view2)

// Create the scene and add it to the view
let gameScene = SKScene(size: CGSize(width: 500, height: 500))
gameScene.scaleMode = .AspectFit
view2.presentScene(gameScene)

// Game Scene content goes here!
let redBox = SKSpriteNode(color: SKColor.redColor(), size: CGSize(width: 50, height: 50))
redBox.position = CGPoint(x: 250, y: 250)
redBox.runAction(SKAction.repeatActionForever(SKAction.rotateByAngle(6, duration: 2)))
gameScene.addChild(redBox)
XCPShowView("SpriteKit", view2)
