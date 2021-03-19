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
        collegeName.text = college?.name
        collegeUniversity.text = college?.university
        collegeCity.text = college?.city
        collegeAddress.text = college?.address
    }

}
