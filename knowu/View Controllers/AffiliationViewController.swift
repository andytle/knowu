//
//  AffiliationViewController.swift
//  knowu
//
//  Created by Sabrina Contaldi on 17/08/2020.
//  Copyright © 2020 Andy Le. All rights reserved.
//

import UIKit

class AffiliationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{

    @IBOutlet weak var ContinueButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
     func setUpElements()
     {
         Utilities.styleFilledButton(ContinueButton)
     }
    
    
    //Create an array of the items in our Picker
        let affiliations = ["I am a University Staff or Faculty Member",
                            "I am the Parent or Guardian of a Prospective Student",
                            "I am a Prospective Student",
                            "I am a Current College Student and Campus Ambassador",
                            "I am a Local Community Member or Business Owner"]
    
    //number of columns in the pickerview (dropdown list)
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    //title for the row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return affiliations[row]
    }
    
    //number of rows in the picker
    func pickerView(_  pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return affiliations.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        label.text = affiliations[row]
    }
    
  
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //The picker has the middle item selected when the page loads
        pickerView.selectRow(affiliations.count/2, inComponent: 0, animated: true)
        
        //Do any additional setup after loading the view
        setUpElements()
        
    }
    
   
    // NEED to pass whatever the label is to the database and store that information with the user's account. Depending on which affiliation is selected, might take the user to a different 'create account' page
    
    
     // An error message if the user hasn't clicked on any of the options
    
//    func validateFields() -> String? {
//         if label == "Choose one of the options below"
//         {
//
//             return "Please select one of the options below."
//         }
//
//         return nil
//     }
//
//     func showError(_ message:String){
//         errorLabel.text = message
//         errorLabel.alpha = 1
//     }
    
    
//    override func didReceiveMemoryWarning()
//    {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated
//    }
    //Not too sure how necessary the above lines of code are or what they do
  
}
 
