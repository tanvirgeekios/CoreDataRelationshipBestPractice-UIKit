//
//  CollegeDetailTableViewController.swift
//  CoreDataRelationship
//
//  Created by MD Tanvir Alam on 19/3/21.
//

import UIKit

class CollegeDetailTableViewController: UITableViewController {
    @IBOutlet weak var collegeName: UILabel!
    @IBOutlet weak var collegeUniversity: UILabel!
    @IBOutlet weak var collegeCity: UILabel!
    @IBOutlet weak var collegeAddress: UILabel!
    var college: College?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        collegeName.text = college?.name
        collegeUniversity.text = college?.university
        collegeCity.text = college?.city
        collegeAddress.text = college?.address
    }
    @IBAction func buttonEditClicked(_ sender: UIBarButtonItem) {
        let formVC = self.storyboard?.instantiateViewController(identifier: "CollegeFormViewController") as! CollegeFormViewController
        formVC.isEdit = true
        formVC.college = college
        self.navigationController?.pushViewController(formVC, animated: true)
    }
}
