/*
* Copyright (c) 2014 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import QuartzCore

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  @IBOutlet var cookieController: UISegmentedControl
  @IBOutlet var addPhotoButton: UIButton
  @IBOutlet var sharePhotoButton: UIButton
  @IBOutlet var photoImageView: UIImageView
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let attributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    cookieController.setTitleTextAttributes(attributes, forState: UIControlState.Selected)
  }
  
  override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator!) {
    super.viewWillTransitionToSize(size, withTransitionCoordinator:coordinator)
    
    coordinator.animateAlongsideTransition(nil, completion: { _ in
      self.didChangeCookieMaskSegment(nil)
      })
  }
  
  func didChangeCookieMaskSegment(sender: UISegmentedControl!) {
    switch cookieController.selectedSegmentIndex {
    case 0:
      applyNoMaskToImage()
    case 1:
      applyCookieMaskToImage()
    case 2:
      applyStarMaskToImage()
    case 3:
      applyHeartMaskToImage()
    default:
      applyNoMaskToImage()
    }
  }
  
  func addPictureButtonSelected(sender: UIButton!) {
    if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum) {
      UIAlertView(title: "Error", message: "Cannot access Saved Photos on device :[", delegate: nil, cancelButtonTitle: "OK").show()
    } else {
      let photoPicker: UIImagePickerController = UIImagePickerController()
      photoPicker.delegate = self
      photoPicker.allowsEditing = true
      photoPicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
      self.showDetailViewController(photoPicker, sender: self)
    }
  }
  
  func applyNoMaskToImage() {
    photoImageView.layer.mask = nil
  }
  
  func applyCookieMaskToImage() {
    let bezzle = CookieCutterMasks.bezierPathForCookieShapeInRect(photoImageView.frame)
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = bezzle.CGPath
    photoImageView.layer.mask = shapeLayer
  }
  
  func applyStarMaskToImage() {
    let bezzle = CookieCutterMasks.bezierPathForStarShapeInRect(photoImageView.frame)
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = bezzle.CGPath
    photoImageView.layer.mask = shapeLayer
  }
  
  func applyHeartMaskToImage() {
    let bezzle = CookieCutterMasks.bezierPathForHeartShapeInRect(photoImageView.frame)
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = bezzle.CGPath
    photoImageView.layer.mask = shapeLayer
  }
  
  func currentMaskedImage() -> UIImage {
    UIGraphicsBeginImageContext(photoImageView.bounds.size);
    photoImageView.layer.renderInContext(UIGraphicsGetCurrentContext())
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext();
    return image;
  }
  
  func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
    picker.dismissViewControllerAnimated(true, completion: {
      self.photoImageView.image = info[UIImagePickerControllerEditedImage] as UIImage
      self.addPhotoButton.hidden = true
      })
  }
  
  func shareImage(sender: UIButton!) {
    let imageToSave = currentMaskedImage()
    let shareText = "Check out this picture I made in Cookie Cutter!"
    let activityViewController = UIActivityViewController(activityItems: [imageToSave, shareText], applicationActivities: nil)
    self.showViewController(activityViewController, sender: self)
  }
}
