//
//  CollegeFormViewController.swift
//  CoreDataRelationship
//
//  Created by MD Tanvir Alam on 18/3/21.
//

import UIKit

class CollegeFormViewController: UIViewController {

    
    //MARK:- outlets
    @IBOutlet weak var collegeNameTxt: UITextField!
    @IBOutlet weak var collegeUniversityTxt: UITextField!
    @IBOutlet weak var collegeCityTxt: UITextField!
    @IBOutlet weak var collegeAddressTxt: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    //MARK:- lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- actions
    @IBAction func saveButtonClicked(_ sender: Any) {
        print("SaveButtonClicked")
        if let newCollege = validate(){
            DatabaseHelper.shared.saveCollegeToCoreData(college: newCollege)
            resetTextFields()
            view.endEditing(true)
            showAlert(title: "Success", message: "Success Saving Data")
        }

    }
    
    //MARK:- functions
    func validate() -> CollegeModel?{
        var message = ""
        guard let collegeName = collegeNameTxt.text else{return nil}
        guard let collegeAddress = collegeAddressTxt.text else{return nil}
        guard let collegeCity = collegeCityTxt.text else{return nil}
        guard let collegeUniversity = collegeUniversityTxt.text else{return nil}
        
        
        if collegeName.trimmingCharacters(in: .whitespaces).isEmpty{
            message += "College Name Can't be empty. "
        }
        
        
        if collegeAddress.trimmingCharacters(in: .whitespaces).isEmpty{
            message += "College address Can't be empty. "
        }
        
        
        if collegeCity.trimmingCharacters(in: .whitespaces).isEmpty{
            message += "College City Can't be empty. "
        }
        
        
        if collegeUniversity.trimmingCharacters(in: .whitespaces).isEmpty{
            message += "College university Can't be empty. "
        }
     
        if(message == ""){
            let newCollege = CollegeModel(collegeName: collegeName, collegeCity: collegeCity, collegeUniversity: collegeUniversity, collegeAddress: collegeAddress)
            return newCollege
        }else{
            showAlert(title: "Error", message: message)
            return nil
        }
        
    }
    
    func showAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func resetTextFields(){
        collegeCityTxt.text = ""
        collegeUniversityTxt.text = ""
        collegeAddressTxt.text = ""
        collegeNameTxt.text = ""
    }
    
}
