//
//  ViewController.swift
//  FoodTracker
//
//  Created by Matthew Weintrub on 10/31/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
        //the view controller is now a delegate for nameTextField


    }
    
    //MARK: UITextFieldDelegate
    func textFieldShoudlReturn(textField: UITextField) -> Bool {
        
        //Hide the keyboard
        textField.resignFirstResponder()
        return true

    }
    
    //take the text in the text field and use it to change the value of the label in the UI
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        //dismiss the picker if user canceled
        dismissViewControllerAnimated(true, completion: nil)
        //this code animates the dismissal of the image picker controller
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //the info dictionary contains multiple representations of the image, and this user the original 
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //set photoImageView to display the selected image
        photoImageView.image = selectedImage
        
        //dismiss the picker
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    //MARK: actions

    @IBAction func setDefaultTextLabel(sender: UIButton) {
        mealNameLabel.text = "default text"
    }

    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        //hide the keyboard
        nameTextField.resignFirstResponder()
        //This code ensures that if the user taps the image view while typing in the text field, the keyboard is dismissed properly.
        
        //UIImagePicker is a view controller that lets a user pick media from their photo library
        let imagePickerController = UIImagePickerController()
        
        //only allow photos to be picked, not taken
        imagePickerController.sourceType = .PhotoLibrary
        
        //make sure the view controller is notified when the user picks an image
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
        // creates method to ask ViewController to present the view controller defined by imagePickerController


    }
}
