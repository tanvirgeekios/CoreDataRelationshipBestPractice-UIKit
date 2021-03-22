//
//  CollegeFormViewController.swift
//  CoreDataRelationship
//
//  Created by MD Tanvir Alam on 18/3/21.
//

import UIKit

class CollegeFormViewController: UIViewController {
    
    var isEdit = false
    var college:College?
    //MARK:- outlets
    @IBOutlet weak var collegeNameTxt: UITextField!
    @IBOutlet weak var collegeUniversityTxt: UITextField!
    @IBOutlet weak var collegeCityTxt: UITextField!
    @IBOutlet weak var collegeAddressTxt: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    //MARK:- lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        if isEdit{
            saveButton.setTitle("Update", for: .normal)
            collegeNameTxt.text = college?.name
            collegeUniversityTxt.text = college?.university
            collegeCityTxt.text = college?.city
            collegeAddressTxt.text = college?.address
        }
    }
    
    //MARK:- actions
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        if isEdit{
            college?.name = collegeNameTxt.text
            college?.university = collegeUniversityTxt.text
            college?.city = collegeCityTxt.text
            college?.address = collegeAddressTxt.text
            DatabaseHelper.shared.updateCollege(college: college)
        }
        else{
            print("SaveButtonClicked")
            if let newCollege = validate(){
                DatabaseHelper.shared.saveCollegeToCoreData(college: newCollege)
                resetTextFields()
                view.endEditing(true)
                showAlert(title: "Success", message: "Success Saving Data")
            }
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
