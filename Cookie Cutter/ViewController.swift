//
//  ViewController.swift
//  Cookie Cutter
//
//  Created by Chris Lowe on 7/1/14.
//  Copyright (c) 2014 Chris Lowe. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet var cookieController: UISegmentedControl
    @IBOutlet var addPhotoButton: UIButton
    @IBOutlet var sharePhotoButton: UIButton
    @IBOutlet var photoImageView: UIImageView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var attributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        cookieController.setTitleTextAttributes(attributes, forState: UIControlState.Selected)
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator!) {
        /*
        - (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
        {
        [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
        [coordinator animateAlongsideTransition:nil completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self didChangeCookieMaskSegment:nil];
        }];
        }*/
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
        /*
        - (IBAction)addPictureButtonSelected:(id)sender {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        [[[UIAlertView alloc] initWithTitle:@"Error"
        message:@"Cannot access Saved Photos on device :["
        delegate:nil
        cancelButtonTitle:@"OK"
        otherButtonTitles: nil] show];
        } else {
        UIImagePickerController *photoPicker = [[UIImagePickerController alloc] init];
        photoPicker.delegate = self;
        photoPicker.allowsEditing = YES;
        photoPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self showViewController:photoPicker sender:self];
        }
        }*/
    }
    
    func applyNoMaskToImage() {
        photoImageView.layer.mask = nil
    }
    
    func applyCookieMaskToImage() {
        let bezzle = CookieCutterMasks.bezierPathForCookieShapeInRect(photoImageView.frame)
        var shapeLayer = CAShapeLayer()
        shapeLayer.path = bezzle.CGPath
        photoImageView.layer.mask = shapeLayer
    }
    
    func applyStarMaskToImage() {
        let bezzle = CookieCutterMasks.bezierPathForStarShapeInRect(photoImageView.frame)
        var shapeLayer = CAShapeLayer()
        shapeLayer.path = bezzle.CGPath
        photoImageView.layer.mask = shapeLayer
    }
    
    func applyHeartMaskToImage() {
        let bezzle = CookieCutterMasks.bezierPathForHeartShapeInRect(photoImageView.frame)
        var shapeLayer = CAShapeLayer()
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
