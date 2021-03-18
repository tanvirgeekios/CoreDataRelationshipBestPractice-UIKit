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
    
    //MARK:- lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- actions
    @IBAction func saveButtonClicked(_ sender: Any) {
        print("SaveButtonClicked")
        guard let collegeName = collegeNameTxt.text else { return  }
        guard let collegeUniversity = collegeUniversityTxt.text else { return  }
        guard let collegeCity = collegeCityTxt.text else { return  }
        guard let collegeAddress = collegeAddressTxt.text else { return  }
        
        let collegeData = CollegeModel(collegeName: collegeName, collegeCity: collegeCity, collegeUniversity: collegeUniversity, collegeAddress: collegeAddress)
        DatabaseHelper.shared.saveCollegeToCoreData(college: collegeData)
    }
    
}
