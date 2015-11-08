//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Matthew Weintrub on 10/31/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: properties
    
    @IBOutlet weak var nameTextField: UITextField!
//    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    @IBOutlet weak var saveButtonPressed: UIBarButtonItem!
    
    
    /*
    This value is either passed by `MealTableViewController` in `prepareForSegue(_:sender:)`
    or constructed as part of adding a new meal.
    */
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
        
        //enable the save button only if the text field has a valid meal name
        checkValidMealNAme()

    }
    
    //MARK: UITextFieldDelegate
    func textFieldShoudlReturn(textField: UITextField) -> Bool {
        
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        //disable the save button while editing
        saveButtonPressed.enabled = false
    }
    
    func checkValidMealNAme() {
        //disable the save button if the text field is empty
        let text = nameTextField.text ?? ""
        saveButtonPressed.enabled = !text.isEmpty
    }
    
    
    //take the text in the text field and use it to change the value of the label in the UI
    
    func textFieldDidEndEditing(textField: UITextField) {

        checkValidMealNAme()
        navigationItem.title = textField.text
    }
    
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        //dismiss the picker if user canceled
        dismissViewControllerAnimated(true, completion: nil)
        //this code animates the dismissal of the image picker controller
        
        print("image picker called")
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //the info dictionary contains multiple representations of the image, and this user the original 
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //set photoImageView to display the selected image
        photoImageView.image = selectedImage
        
        //dismiss the picker
        dismissViewControllerAnimated(true, completion: nil)
        
        
        print("assigns image to object")
        
    }
    
    //MARK: navigation ==================================================================
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
        print("cancel create meal")
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButtonPressed === sender {
            
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            //set the meal name to be passed to MealTableViewController after the unwind Segue
            meal = Meal(name:name, photo: photo, rating:rating)
            
        }
        
        print("meal saved, prepared for segue to mealTableViewController")
    }
    
    
    //MARK: actions ==================================================================

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

        print("loads photos available")
    }
}
